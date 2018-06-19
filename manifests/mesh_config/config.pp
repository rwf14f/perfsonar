class perfsonar::mesh_config::config(
  $mesh_config  = [],
  $admin_emails = [],
  $options      = {},
) inherits perfsonar::params {

  file { '/etc/perfsonar/meshconfig-agent.conf':
    ensure  => 'present',
    owner   => 'perfsonar',
    group   => 'perfsonar',
    mode    => '0644',
    content => template("${module_name}/agent_configuration.conf.erb"),
    require => Package['perfsonar-meshconfig-agent'],
  }
}
