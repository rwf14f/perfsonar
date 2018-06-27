class perfsonar::owamp::config(
  $test_port    = $::perfsonar::config::owamp_test_port,
  $log_facility = 'local5',
  $log_verbose  = true,
  $limits       = [
    'root with disk=0, bandwidth=0, delete_on_fetch=on, allow_open_mode=on',
    'regular with parent=root, disk=10G, bandwidth=20M, delete_on_fetch=on, allow_open_mode=on',
    'jail with parent=root, bandwidth=1, disk=1, allow_open_mode=off',
  ],
) inherits perfsonar::config {

  file { '/etc/owamp-server/owamp-server.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/owamp-server.conf.erb"),
    require => Package['owamp-server'],
    notify  => Service['owamp-server'],
  }
  file { '/etc/owamp-server/owamp-server.limits':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/owamp-server.limits.erb"),
    require => Package['owamp-server'],
    notify  => Service['owamp-server'],
  }
}
