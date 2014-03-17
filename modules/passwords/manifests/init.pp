class passwords::root {
    if ! defined (Package['sudo-ldap']) {
        package { 'sudo-ldap':
            ensure => latest;
        }
    }

    user { 'root':
        password => '!',
        before   => Package['sudo-ldap'];
    }

    file {
        '/etc/ssh/userkeys':
            ensure => directory,
            owner  => root,
            group  => root,
            mode   => '0700';
        '/etc/ssh/userkeys/root':
            ensure  => directory,
            owner   => root,
            group   => root,
            mode    => '0700',
            require => File['/etc/ssh/userkeys'];
        '/etc/ssh/userkeys/root/.ssh':
            ensure  => directory,
            owner   => root,
            group   => root,
            mode    => '0700',
            require => File['/etc/ssh/userkeys/root'];
        '/etc/ssh/userkeys/root/.ssh/authorized_keys':
            owner   => root,
            group   => root,
            mode    => '0600',
            source  => 'puppet:///private/ssh/root-authorized-keys',
            require => File['/etc/ssh/userkeys/root/.ssh'];
    }
}

class passwords::certs {
    $certs_default_pass = 'testdevpass'
}

class passwords::misc::scripts {
    $cachemgr_pass   = 'IamNotSet'
    $mysql_root_pass = 'IamNotSet'
    $nagios_sql_pass = 'IamNotSet'
    $webshop_pass    = 'IamNotSet'
    $wikiadmin_pass  = 'fdgaggrehresjarejas'
    $wikiuser2_pass  = 'IamNotSet'
    $wikiuser_pass   = 'IamNotSet'
    $wikiuser_pass_nagios = 'IamNotSet'
    $wikiuser_pass_real   = 'IamNotSet'
    $wikinotifier_user = 'labslogbot'
    $wikinotifier_pass = 'dumbpassword'
}

class passwords::openstack::nova {
    # Excluding the proxyagent_pass, which needs to be the same
    # use the same fake password for everything openstack related.
    $nova_db_pass = 'ueThe7moh7Hah'
    $nova_ldap_user_pass = 'ueThe7moh7Hah'
    $nova_ldap_proxyagent_pass = 'Eche0ieng8UaNoo'
    $controller_mysql_root_pass = 'ueThe7moh7Hah'
    $nova_puppet_user_pass = 'ueThe7moh7Hah'
}

class passwords::openstack::neutron {
    $neutron_ldap_user_pass = 'bogus'
}

class passwords::openstack::glance {
    # Excluding the proxyagent_pass, which needs to be the same
    # use the same fake password for everything openstack related.
    $glance_db_pass = 'ueThe7moh7Hah'
}

class passwords::openstack::keystone {
    # Excluding the proxyagent_pass, which needs to be the same
    # use the same fake password for everything openstack related.
    $keystone_db_pass = 'ueThe7moh7Hah'
    $keystone_ldap_user_pass = 'ueThe7moh7Hah'
    $keystone_ldap_proxyagent_pass = 'Eche0ieng8UaNoo'
    $keystone_admin_token = 'ADMIN'
}

class passwords::ldap::initial_setup {
    $initial_password = 'ueThe7moh7Hah'
    #TODO: remove redundant variable when no longer referenced
    $ldap_initial_password = 'ueThe7moh7Hah'
}

class passwords::ldap::production {
    $proxypass = 'Eche0ieng8UaNoo'
    $ldap_user_pass = ''
}

class passwords::ldap::corp {
    $proxypass = ''
    $ldap_user_pass = ''
}

class passwords::ldap::labs {
    $proxypass = 'Eche0ieng8UaNoo'
    $script_user_pass = ''
}

# TODO: remove these classes when references are gone
class passwords::ldap::wmf_cluster {
    $proxypass = 'Eche0ieng8UaNoo'
    $ldap_user_pass = ''
}

class passwords::ldap::wmf_corp_cluster {
    $proxypass = 'Eche0ieng8UaNoo'
    $ldap_user_pass = ''
}

class passwords::ldap::wmf_test_cluster {
    $proxypass = 'Eche0ieng8UaNoo'
    $ldap_user_pass = ''
}

class passwords::puppet::database {
    $puppet_production_db_pass = ''
}

class passwords::nagios::mysql {
    $mysql_check_pass = ''
    $mysql_enwiki_user = ''
    $mysql_enwiki_pass = ''
}

class passwords::nagios::monitor {
    $gammu_pin = ''
}

class passwords::nagios::snmp {
    $pdu_snmp_pass = ''
}

class passwords::lucene {
    $oai_pass = 'hyaREgJ3zNpLAFkH'
}

class passwords::ganglia {
    $ganglia_mysql_pass = ''
}

class passwords::etherpad {
    $etherpad_admin_pass = ''
    $etherpad_sql_pass = ''
}

class passwords::etherpad_lite {
    $etherpad_db_pass = ''
}

class passwords::gerrit {
    $gerrit_pass = ''
    $gerrit_db_pass = 'l5uCkoYX+zYtH'
    $gerrit_email_key = 'AsL1PruNcpXuSAIjcCLqT'
    $gerrit_rest_token = 'PeiR/lnSzh/2ntJyd7QZt+fjgWtOFLCdm/I='
    $gerrit_bz_pass = ''
}

class passwords::civi {
    $civimail_pass = ''
}

class passwords::network {
    $router_pass = ''
}

class passwords::puppetmaster::dashboard {
    $db_pass = 'Cggn4AU'
}

class passwords::racktables {
    $racktables_db_user = 'racktables'
    $racktables_db_pass = 'fakebrokenpassword'
}

class passwords::misc::rt {
    $rt_mysql_user = 'rtuser'
    $rt_mysql_pass = 'fakertpassword'
}

class passwords::misc::contint::jenkins {
    # API key for 'zuul' user on http://integration.wmflabs.org/ci/
    $zuul_user_apikey = '2a898e64b7c1b5399aaa7abb5a6b350e'
    $jobbuilder_user_apikey = 'd1ae36235638ce19b2aef73a8cb510a7'
}

class passwords::mongodb::eventlogging {
    $user = 'eventloggingusername'
    $password = 'fakepassword'
}

class passwords::mysql::eventlogging {
    $user = 'eventlogging'
    $password = '68QrOq220717816UycU1'
}

class passwords::mysql::wikimania_scholarships {
    $user = 'scholarships'
    $password = '4i0Xd5mFBf3GshAVPy9RBwdG'
    $app_user = 'scholarships_app'
    $app_password = 'rudOmOtJeytErIdmyivvajDu'
}

class passwords::redis {
    $main_password = 'Q6dzak4k9vjYjh341fHS'
}

class passwords::geoip {
    $license_key = 'fakelicensekey'
    $user_id = '12345'
}

class passwords::logstash {
    $redis = '73HaA7xh2ZEq'
}
