#!/usr/bin/env python3

import logging
import os
import yaml

from argparse import ArgumentParser
from collections import defaultdict

def get_args():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument('--private', default='/srv/private/hieradata' )
    parser.add_argument('--labs-private', default='~/git/private/hieradata' )
    parser.add_argument('-F', '--fix', action='store_true' )
    parser.add_argument('-v', '--verbose', action='count' )
    return parser.parse_args()

def get_log_level(args_level):
    return {
        None: logging.ERROR,
        1: logging.WARN,
        2: logging.INFO,
        3: logging.DEBUG}.get(args_level, logging.DEBUG)


def compare_directories(private_dir, labs_private_dir):
    missing_files = []
    missing_keys = defaultdict(list)
    for (path, directories, files) in os.walk(private_dir):
        relative_path = os.path.relpath(path, private_dir)
        for hiera_file in files:
            labs_hiera_file = os.path.join(labs_private_dir, relative_path, hiera_file)
            logging.debug('Checking file exists: %s', labs_hiera_file)
            if not os.path.isfile(labs_hiera_file):
                logging.error('Missing File: %s', labs_hiera_file)
                missing_files.append(labs_hiera_file)
                continue
            private_file = os.path.join(path, hiera_file)
            labs_hiera = yaml.safe_load(open(labs_hiera_file))
            private_hiera = yaml.safe_load(open(private_file))

            if private_hiera is None:
                continue

            for private_key in private_hiera.keys():
                if private_key not in labs_hiera:
                    logging.error('%s - Missing key: %s', labs_hiera_file, private_key)
                    missing_keys[labs_hiera_file].append(private_key)
                    continue
    return (missing_files, missing_keys)


def clean_data(obj, replace='nosuchpass'):
    if isinstance(obj, list):
        return [replace]
    elif not isinstance(obj, dict):
        return replace

    clean = {}
    for key, value in obj.items():
        if isinstance(value, dict):
            clean[key] = clean_data(value)
        elif isinstance(value, list):
            clean[key] = [replace]
        else:
            clean[key] = replace
    return clean


def add_missing_files(missing_files, private_dir, labs_private_dir):
    for missing_file in missing_files:
        relative_path = os.path.relpath(missing_file, labs_private_dir)
        private_file = os.path.join(private_dir, relative_path)
        private_hiera = yaml.safe_load(open(private_file))
        labs_hiera = clean_data(private_hiera)
        logging.debug('Writing file: %s', missing_file)  
        os.makedirs(os.path.dirname(missing_file), exist_ok=True)
        with open(missing_file, 'w') as hiera_file:
            yaml.dump(labs_hiera, hiera_file, default_flow_style=False)


def add_missing_keys(missing_keys, private_dir, labs_private_dir):
    for labs_file, keys in missing_keys.items():
        relative_path = os.path.relpath(labs_file, labs_private_dir)
        private_file = os.path.join(private_dir, relative_path)
        private_hiera = yaml.safe_load(open(private_file))
        with open(labs_file, 'r+') as labs_fh:
            labs_hiera = yaml.safe_load(labs_fh)
            for key in keys:
                logging.debug('%s - adding key: %s', labs_file, key)
                labs_hiera[key] = clean_data(private_hiera[key])
            labs_fh.seek(0)
            labs_fh.truncate()
            yaml.dump(labs_hiera, labs_fh, default_flow_style=False)


def main():
    args = get_args()
    logging.basicConfig(level=get_log_level(args.verbose))
    private_dir = os.path.expanduser(args.private)
    labs_private_dir = os.path.expanduser(args.labs_private)
    logging.debug('private_dir: %s', private_dir)
    logging.debug('labs_private_dir: %s', labs_private_dir)
    (missing_files, missing_keys) = compare_directories(private_dir, labs_private_dir)
    if args.fix:
        add_missing_files(missing_files, private_dir, labs_private_dir)
        add_missing_keys(missing_keys, private_dir, labs_private_dir)

if __name__ == '__main__':
    main()

