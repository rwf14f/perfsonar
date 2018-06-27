class perfsonar::mesh_config::config(
  $mesh_config      = [],
  $admin_emails     = [],
  $options          = {},
  $add_task_default = true,
) inherits perfsonar::params {

  file { '/etc/perfsonar/meshconfig-agent.conf':
    ensure  => 'present',
    owner   => 'perfsonar',
    group   => 'perfsonar',
    mode    => '0644',
    content => template("${module_name}/agent_configuration.conf.erb"),
    require => Package['perfsonar-meshconfig-agent'],
    notify  => Service['perfsonar-meshconfig-agent'],
  }
  if $add_task_default {
    include 'perfsonar::owamp::config'
    $owamp_test_port = $::perfsonar::owamp::config::test_port
    $owamp_test_port_line = "^\s*receive_port_range\s+${owamp_test_port}\s*$"
    file { '/var/lib/perfsonar/meshconfig/puppet_owamp_defaults':
      ensure    => 'present',
      owner     => 'root',
      group     => 'root',
      mode      => '0644',
      content   => template("${module_name}/meshconfig_owamp_defaults.erb"),
      subscribe => File['/etc/owamp-server/owamp-server.conf'],
      require   => Package['perfsonar-meshconfig-agent'], # need to check with testpoint, not sure what creates the meshconfig directory
    }
    exec { 'clean old owamp defaults':
      # this deletes the whole <default_parameters> block and will need amending if the perfsonar team decides to fiddle with it
      command     => '/bin/sed -i \'/^\s*<default_parameters>\s*$/,/^\s*<\/default_parameters>\s*$/d\' /etc/perfsonar/meshconfig-agent-tasks.conf',
      # only delete the default_parameters block if the owamp ports change (as defined in perfsonar::owamp::config)
      unless      => "/bin/egrep -q '${owamp_test_port_line}' /etc/perfsonar/meshconfig-agent-tasks.conf",
      subscribe   => File['/var/lib/perfsonar/meshconfig/puppet_owamp_defaults'],
      notify      => Exec['meshconfig set owamp defaults'],
      refreshonly => true,
    }
    exec { 'meshconfig set owamp defaults':
      command     => '/bin/cat /var/lib/perfsonar/meshconfig/puppet_owamp_defaults >> /etc/perfsonar/meshconfig-agent-tasks.conf',
      unless      => "/bin/egrep -q '${owamp_test_port_line}' /etc/perfsonar/meshconfig-agent-tasks.conf",
      subscribe   => File['/var/lib/perfsonar/meshconfig/puppet_owamp_defaults'],
      notify      => Service['perfsonar-meshconfig-agent'],
      refreshonly => true,
    }
  }
}
