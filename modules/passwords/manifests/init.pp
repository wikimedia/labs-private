##################################################
##################################################
###   PASSWORDS HERE ARE PUBLICLY AVAILABLE   ####
##################################################
##################################################

class passwords::root(
    $extra_keys = undef,
){
    if $extra_keys {
        $flat_extra_keys = join(values($extra_keys), "\n")
    } else {
        $flat_extra_keys = ''
    }

    ssh::userkey { 'root':
        ensure => present,
        content => template('passwords/root-authorized-keys.erb'),
    }
}

class passwords::certs {
    $certs_default_pass = 'testdevpass'
}

class passwords::misc::scripts {
    $cachemgr_pass          = 'IamNotSet'
    $mysql_root_pass        = 'IamNotSet'
    $mysql_labsdb_root_pass = 'IamNotSet'
    $mysql_repl_user        = 'repl'
    $mysql_repl_pass        = 'ReplIamNotSet'
    $nagios_sql_pass        = 'IamNotSet'
    $webshop_pass           = 'IamNotSet'
    $wikiadmin_pass         = 'fdgaggrehresjarejas'
    $wikiuser2_pass         = 'IamNotSet'
    $wikiuser_pass          = 'IamNotSet'
    $wikiuser_pass_nagios   = 'IamNotSet'
    $wikiuser_pass_real     = 'IamNotSet'
    $wikinotifier_user      = 'labslogbot'
    $wikinotifier_pass      = 'dumbpassword'
}

class passwords::openstack::nova {
    # Excluding the proxyagent_pass, which needs to be the same
    # use the same fake password for everything openstack related.
    $nova_db_pass = 'ueThe7moh7Hah'
    $controller_mysql_root_pass = 'ueThe7moh7Hah'
    $nova_puppet_user_pass = 'ueThe7moh7Hah'
}

class passwords::openstack::api {
    $nova_observer_name = 'novaobserver'
    $nova_observer_pass = 'Fs6Dq2RtG8KwmM2Z'
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
    $keystone_admin_token = 'ADMIN'
}

class passwords::ldap::initial_setup {
    $initial_password = 'ueThe7moh7Hah'
    #TODO: remove redundant variable when no longer referenced
    $ldap_initial_password = 'ueThe7moh7Hah'
}

class passwords::ldap::production {
    $proxypass = 'Eche0ieng8UaNoo'
    $ldap_user_pass = 'ueThe7moh7Hah'
}

class passwords::ldap::corp {
    $proxypass = ''
    $ldap_user_pass = ''
}

class passwords::labs::rabbitmq {
    $rabbit_userid = 'auser'
    $rabbit_password  = 'apassword'
}

class passwords::ldap::labs {
    $proxypass = 'Eche0ieng8UaNoo'
    $script_user_pass = 'ueThe7moh7Hah'
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
    $gerrit_email_key = 'AsL1PruNcpXuSAIjcCLqT'
    $gerrit_phab_cert = 'UnknownValue'
    $gerrit_phab_token = 'cli-unknownvalue'
    $prometheus_bearer_token = 'prome123'
}

class passwords::civi {
    $civimail_pass = ''
}

class passwords::network {
    $snmp_ro_community = ''
}

class passwords::racktables {
    $racktables_db_user = 'racktables'
    $racktables_db_pass = 'fakebrokenpassword'
}

class passwords::misc::rt {
    $rt_mysql_user = 'rtuser'
    $rt_mysql_pass = 'fakertpassword'
}

class passwords::misc::private_static_site {
        $user = "fakeuser"
        $pass = "fakepass"
}

class passwords::tendril {
        $db_user = "fakeuser"
        $db_pass = "fakepass"
}

class passwords::nodepool {
    # Jenkins API token. Used by Nodepool to attach/detach slaves.
    $jenkins_api_key = 'fakekey'

    # Password of the user that has access to the OpenStack API
    $manager_pass = 'fakepass'

    $nodepooldb_pass = ""
}

class passwords::mongodb::eventlogging {
    $user = 'eventloggingusername'
    $password = 'fakepassword'
}

class passwords::mysql::airflow::search {
    $user = 'fakeuser'
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

class passwords::mysql::analytics_labsdb {
    $user = 'ann'
    $pass = 'yong'
}

class passwords::mysql::phabricator {
    $admin_user = 'admin_user'
    $admin_pass = 'admin_pass'
    $app_user = 'app_user'
    $app_pass = 'app_pass'
    #temp accounting instance for legalpad
    $radon_admin_pass = 'radon_admin_pass'
    $radon_app_pass = 'radon_app_pass'
    $bz_user = 'bz_user'
    $bz_pass = 'bz_pass'
    $rt_user = 'rt_user'
    $rt_pass = 'rt_pass'
    $manifest_user = 'manifest_user'
    $manifest_pass = 'manifest_pass'
    $metrics_user = 'metrics_user'
    $metrics_pass = 'metrics_pass'
}

class passwords::mysql::querydigest {
    $mysql_ops_db = 'bogus'
}

class passwords::mysql::sul {
    $user = 'user'
    $pass = 'pass'
}

class passwords::mysql::labsdb {
    $user = 'user'
    $password = 'pass'
}

class passwords::mysql::iegreview {
    $admin_user = 'longcat'
    $app_user = 'maru'
    $admin_password = 'hunter2'
    $app_password = 'swordfish'
}

class passwords::mysql::wikimania_scholarships {
    $user = 'scholarships'
    $password = '4i0Xd5mFBf3GshAVPy9RBwdG'
    $app_user = 'scholarships_app'
    $app_password = 'rudOmOtJeytErIdmyivvajDu'
}

class passwords::mysql::xhgui {
    $user = 'xhgui'
    $password = 'Thiz8Ev8Xetho8mu'
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

class passwords::librenms {
    $ircbot_pass = 'nickserv_fake_password'
    $db_user = 'foo'
    $db_pass = 'bar'
}

class passwords::bugzilla {
    $bugzilla_db_pass = 'snakeoil'
    $bugzilla_site_secret = 'fnord1234567890'
}

class passwords::graphite {
    $user = 'admin'
    $pass = 'this_isnt_a_real_password'
    $secret_key = 'q(i4#l43x&5+o_ckyz#+#v_k934@cj0xi3qi80#)72imf#_jf^'
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

class passwords::postgres {
    $replication_pass = 'hi'
    $ganglia_user = 'yougotafight'
    $ganglia_pass = 'foryourright'
    $labsadmin_password = 'toparty'
}

class passwords::udpmxircecho {
    $udpmxircecho_pass = "FAKEFAKEFAKE"
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

class passwords::tor {
    $hashed_control_password = '16:DEB7ED95B2FFA54360D49BCB2AC9AD4AE49F00E541CEB490854F74128A'
}

class passwords::phabricator {
    $emailbot_cert = 'qz9j1xkk2gagay6iecsc1jnr5irhsl890aywumntq4a722n1bicflgo16q2r7o9f4h2emcd42g7rwpfl7s3ggiubw65uu7jdd3gjtvb6pup44tvbsn01z4ee6xubma8n0d0iyjzn9myadp2sw93lk0ezg49utj4ykarq8ti850860ojtgpji0joqzir2r46k4ygcmj2j4kinytr4musw34d6cjaea48mwtim9xvjrs6dow9d3easgdpc1q21ehn'
    $pastebot_cert = 'l2noi4u2hl34me23tz9dwo5go7mdx06j62xppt28famvvkoeuw6sk8kn9ndc0oxd6yina11l8pj2lxpyxwz56e41n6fgxth1jdppar91b9mfiign9270ih2jxysv3zt0hlkm0vlhnwyaza6log0ertuvwdgggxvdeesu4cjdhby141ie9wpfyfe1bjy05bq5om5d314u2fh49797556n9ifesu5xelfuqrfkx4bedqz0tnt91ckomqii7wbiy2e'
    $ops_monitoring_bot_token = 'api-dummy-token'
    $phabtools_cert = 'phabtools_cert'
    $phabtools_user = 'phabtools_user'
    $gerritbot_token = 'gerritbot_token'
    $offboarding_script_token = 'offboarding-dummy-token'
}

class passwords::statistics::user {
    # This password will be used to generate a .git-credentials file
    # in the stats user's home directory on stat boxes.
    # This allows the stats user to push to gerrit in automated
    # cron jobs via http.
    $gerrit_http_password = 'yeahrightapass'
}

class passwords::cxserver {
    # This is temporary key to test Yandex MT for Content Translation.
    $yandex_api_key = 'trnsl.1.1.20150216T113622Z.2ccb71d878ea0b58.5ac57322acecfa2d9001aad077fdcff21c206a43'
    $youdao_app_key = 'dummykey'
    $youdao_app_secret = 'dummysecret'
    $matxin_api_key = 'dummykey'
    # JWT token for ContentTranslation
    $jwt_secret = 'H.9F-.|,SC#Von%?Tklo"a<uPFOcxI$>'
    $lingocloud_api_key = 'dummykey'
    $google_api_key = 'dummykey'
}

class passwords::pdns {
    $db_pass = 'dummy'
}

class passwords::designate {
    $db_user = 'dummyuser'
    $db_pass = 'dummy'
}

# DEPRECATED - 2017-01-15
class passwords::grafana::production {
    $secret_key     = 'aaaaa'
    $admin_password = 'aaaa'
}

# DEPRECATED - 2017-01-15
class passwords::grafana::labs {
    $secret_key     = 'aaaaab'
    $admin_password = 'aaaab'
}

class passwords::labs::toollabs {
    $nova_user = 'nobody'
    $nova_password = 'nobody'
}

class passwords::yubiauth {
    $api_key = 'notreally'
}

class passwords::openldap::corp {
    $sync_pass = 'FOOOOOOOOOOOOOOO'
}

class passwords::openldap::labs {
    $sync_pass = 'BAAAAAAAAAAAAAAR'
    $monitor_pass = 'openldaplabsmonitorpass'
}

class passwords::openldap::labtest {
    $sync_pass = 'FOOOOOOOOBAAAAAAAAAAR'
    $monitor_pass = 'openldaplabtestmonitorpass'
}

class passwords::tessera {
    $secret_key = 'notsecret'
}

class passwords::cassandra {
    $restbase = 'notsecret'
    $sessions = 'fake_session_password'
    $aqs = 'notsecret'
    $application_username = 'sessions'
    $application_password = 'fake_app_password'
    $super_username = 'cassandra'
    $super_password = 'fake_super_password'
}

class passwords::testreduce::mysql {
    $db_pass           = 'notsecret'
    $mysql_client_pass = 'notsecret'
}

class passwords::prometheus {
    $db_pass = 'notsecret'
}

class passwords::aqs {
    $aqs_user = 'notsecret'
}

class passwords::striker {
    $application_db_password = 'notsecret'
    $admin_db_password = 'notsecret'
}

class passwords::labs::db::proxy {
    $admin_user = 'notsecret'
    $admin_password = 'notsecret'
}

class passwords::mirrors {
    $debian_rsync_username = 'username'
    $debian_rsync_password = 'password'
}

class passwords::labsdb::maintainviews {
    $user = 'notsecret'
    $db_pass = 'notsecret'
}

class passwords::labsdb::maintainindexes {
    $user = 'notsecret'
    $db_pass = 'notsecret'
}

class passwords::labspuppet {
    $db_password = 'notsecret'
}

class passwords::labsdbaccounts {
    $db_password = 'notsecret'
}

class passwords::etcd {
    $accounts = {
        'root'     => 'Wikipedia',
        'conftool' => 'another_secret',
    }
}

class passwords::icinga {
    $nsca_decrypt_password = 'fakenotsecrettest'
}

class passwords::rddmarc {
    $db_password = 'notsecret'
}

class passwords::netbox {
    $db_password = 'notsecret'
    $secret_key = 'notsecret'
    $replication_password = 'notsecret'
}

class passwords::birdlg {
    $secret_key = 'notsecret'
}

class passwords::recommendationapi::mysql {
   $recommendationapi_pass = 'notsecret'
   $recommendationapiservice_pass = 'notsecret'
}

class passwords::netops {
   $ripeatlas_cli_api_key = 'dummy'
}

# make sure password is the same in role/common/wikidough.yaml
class passwords::wikidough::dnsdist {
   $console_key = 'snake oil'
   $password = 'snake oil'
}
