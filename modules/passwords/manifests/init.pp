##################################################
##################################################
###   PASSWORDS HERE ARE PUBLICLY AVAILABLE   ####
##################################################
##################################################

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
    $etherpad_db_user = 'etherpad'
    $etherpad_db_host = 'localhost'
    $etherpad_db_name = 'etherpad'
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

class passwords::mysql::dump {
    $user = 'meh'
    $password = 'mah'
}

class passwords::mysql::eventlogging {
    $user = 'eventlogging'
    $password = '68QrOq220717816UycU1'
}

class passwords::mysql::frack {
    $user = 'user'
    $pass = 'pass'
}

class passwords::mysql::globaldev { }

class passwords::mysql::research {
    $user = 'getup'
    $pass = 'standup'
}

class passwords::mysql::otrs {
    $user = 'user'
    $pass = 'pass'
}

class passwords::mysql::phabricator {
    $admin_user = 'admin_user'
    $admin_pass = 'admin_pass'
    $app_user = 'app_user'
    $app_pass = 'app_pass'
    #temp accounting instance for legalpad
    $radon_admin_pass = 'radon_admin_pass'
    $radon_app_pass = 'radon_app_pass'
}

class passwords::mysql::querydigest {
    $mysql_ops_db = 'bogus'
}

class passwords::mysql::sul {
    $user = 'user'
    $pass = 'pass'
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

class passwords::librenms { }

class passwords::bugzilla {
    $bugzilla_db_pass = 'snakeoil'
    $bugzilla_site_secret = 'fnord1234567890'
}

class passwords::graphite {
    $user = 'admin'
    $pass = 'this_isnt_a_real_password'
    $secret_key = 'q(i4#l43x&5+o_ckyz#+#v_k934@cj0xi3qi80#)72imf#_jf^'
}

class passwords::swift::eqiad_prod {
    $super_admin_key = 'rollingstones'
    $rewrite_password = 'thebeatles'
    $dispersion_password = 'ledzeppelin'
    $search_password = 'queen'
}

class passwords::swift::esams_prod {
    $super_admin_key = 'blur'
    $rewrite_password = 'oasis'
    $dispersion_password = 'theverve'
    $search_password = 'thekinks'
}

class passwords::exim {
    $smtp_ldap_password = 'smtp'
    $otrs_mysql_password = 'otrs'
}

class passwords::analytics {
    $http_proxy_auth = {
        'wmf-analytics' => 'r'
    }
    $sqoop_mysql_user = 'e'
    $sqoop_mysql_pass = 'a'
    $libanon_salt = 'l'

    $hive_jdbc_password   = 'l'
    $oozie_jdbc_password  = 'y'

    $hue_secret_key       = '!'
}

class passwords::bacula {
    $database = 'meh'
}

class passwords::mobile::vumi {
    $wikipedia_xmpp_sms_out = 'xmpp'
    $wikipedia_xmpp = 'again'
    $tata_sms_incoming_pw = 'foo'
    $tata_sms_outgoing_pw = 'bar'
    $tata_ussd_pw = 'baz'
    $tata_hyd_ussd_pw = 'FuzzBuz'
}

class passwords::osm {
    $replication_pass = 'hi'
    $osm_password = 'ciao'
    $kolossos_password = 'salut'
    $aude_password = 'hallo'
    $planemad_password = 'ola'
    $ganglia_user = 'yougotafight'
    $ganglia_pass = 'foryourright'
}

class passwords::rancid {
    $rancidpass = 'theclash'
}

class passwords::udpmxircecho {
    $udpmxircecho_pass = "surfin'bird"
}

class passwords::geowiki { }

class passwords::logmsgbot {
    $logmsgbot_password = 'thew'
}

class passwords::wikitech {
    $wikitech_db_password = 'password'
    $wikitech_secret_key = 'secretkey'
    $wikitech_upgrade_key = 'upgradekey'
    $wikitech_captcha_secret = 'captcha_secret'
}

class passwords::servermon {
    $db_user = 'user'
    $db_password = 'password'
    $secret_key = 'secret_key'
}

class passwords::phabricator {
    $emailbot_cert = 'supersecret'
}
