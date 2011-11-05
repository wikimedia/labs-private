class passwords::root {

	user { root:
		password => '$1$OjS2vIPp$aM7g85IK163Npwx/9M7nF.',
		before => Package['sudo-ldap'];
	}

	file {
		"/root/.ssh":
			group => root,
			mode => 0700,
			ensure => directory;
		"/root/.ssh/authorized_keys":
			group => root,
			mode => 0600,
			source => "puppet:///private/ssh/root-authorized-keys",
			require => File["/root/.ssh"];
	}

}

class passwords::certs {

	$certs_default_pass = "testdevpass"

}

class passwords::openstack::nova {

	$nova_db_pass = ""
	$nova_ldap_user_pass = ""
	$nova_ldap_proxyagent_pass = ""
	$controller_mysql_root_pass = ""
	$nova_puppet_user_pass = ""

}

class passwords::openstack::glance {

	$glance_db_pass = ""

}

class passwords::ldap::initial_setup {

	$ldap_initial_password = ""

}

class passwords::ldap::wmf_cluster {

	$proxypass = ""
	$ldap_user_pass = ""

}

class passwords::ldap::wmf_corp_cluster {

	$proxypass = ""
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
