class perfsonar::owamp::config(
  $test_port    = $::perfsonar::config::owamp_test_port,
  $log_facility = 'local5',
  $log_verbose  = true,
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
}
