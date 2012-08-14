class passwords::root {

	user { root:
		password => '$1$OjS2vIPp$aM7g85IK163Npwx/9M7nF.',
		before => Package['sudo-ldap'];
	}

	file {
		"/etc/ssh/userkeys":
			group => root,
			mode => 0700,
			ensure => directory;
		"/etc/ssh/userkeys/root":
			group => root,
			mode => 0700,
			ensure => directory,
			require => File["/etc/ssh/userkeys"];
		"/etc/ssh/userkeys/root/.ssh":
			group => root,
			mode => 0700,
			ensure => directory,
			require => File["/etc/ssh/userkeys/root"];
		"/etc/ssh/userkeys/root/.ssh/authorized_keys":
			group => root,
			mode => 0600,
			source => "puppet:///private/ssh/root-authorized-keys",
			require => File["/etc/ssh/userkeys/root/.ssh"];
	}

}

class passwords::certs {

	$certs_default_pass = "testdevpass"

}

class passwords::misc::scripts {
	$cachemgr_pass   = 'IamNotSet'
	$mysql_root_pass = 'IamNotSet'
	$nagios_sql_pass = 'IamNotSet'
	$webshop_pass    = 'IamNotSet'
	$wikiadmin_pass  = 'IamNotSet'
	$wikiuser2_pass  = 'IamNotSet'
	$wikiuser_pass   = 'IamNotSet'
	$wikiuser_pass_nagios = 'IamNotSet'
	$wikiuser_pass_real   = 'IamNotSet'
}

class passwords::openstack::nova {

	# Excluding the proxyagent_pass, which needs to be the same
	# use the same fake password for everything openstack related.
	$nova_db_pass = "ueThe7moh7Hah"
	$nova_ldap_user_pass = "ueThe7moh7Hah"
	$nova_ldap_proxyagent_pass = "Eche0ieng8UaNoo"
	$controller_mysql_root_pass = "ueThe7moh7Hah"
	$nova_puppet_user_pass = "ueThe7moh7Hah"

}

class passwords::openstack::glance {

	# Excluding the proxyagent_pass, which needs to be the same
	# use the same fake password for everything openstack related.
	$glance_db_pass = "ueThe7moh7Hah"

}

class passwords::openstack::keystone {

	# Excluding the proxyagent_pass, which needs to be the same
	# use the same fake password for everything openstack related.
	$keystone_db_pass = "ueThe7moh7Hah"
	$keystone_ldap_user_pass = "ueThe7moh7Hah"
	$keystone_ldap_proxyagent_pass = "Eche0ieng8UaNoo"
	$keystone_admin_token = "ADMIN"

}

class passwords::ldap::initial_setup {

	$ldap_initial_password = "ueThe7moh7Hah"

}

class passwords::ldap::production {
	$proxypass = "Eche0ieng8UaNoo"
	$ldap_user_pass = ""
}

class passwords::ldap::corp {
	$proxypass = ""
	$ldap_user_pass = ""
}

class passwords::ldap::labs {
	$proxypass = "Eche0ieng8UaNoo"
	$ldap_user_pass = ""
}

# TODO: remove these classes when references are gone
class passwords::ldap::wmf_cluster {
	$proxypass = "Eche0ieng8UaNoo"
	$ldap_user_pass = ""
}
class passwords::ldap::wmf_corp_cluster {
	$proxypass = "Eche0ieng8UaNoo"
	$ldap_user_pass = ""
}
class passwords::ldap::wmf_test_cluster {
	$proxypass = "Eche0ieng8UaNoo"
	$ldap_user_pass = ""
}

class passwords::puppet::database {

	$puppet_production_db_pass = ""
}

class passwords::nagios::mysql {

	$mysql_check_pass = ""
	$mysql_enwiki_user = ""
	$mysql_enwiki_pass = ""

}

class passwords::nagios::monitor {

	$gammu_pin = ""

}

class passwords::nagios::snmp {

	$pdu_snmp_pass = ""

}

class passwords::lucene {

	$oai_pass = ""

}

class passwords::ganglia {

	$ganglia_mysql_pass = ""

}

class passwords::etherpad {

	$etherpad_admin_pass = ""
	$etherpad_sql_pass = ""

}

class passwords::etherpad_lite {

	$etherpad_db_pass = ""

}

class passwords::gerrit {

	$gerrit_db_pass = ""

}

class passwords::civi {

	$civimail_pass = ""

}

class passwords::network {

	$router_pass = ""

}

class passwords::puppetmaster::dashboard {

	$db_pass = "Cggn4AU"

}

class passwords::misc::racktables {

#Randomly generated password for test instance

	$racktables_mysql_pass = "VgsK9PhM9b"

}
