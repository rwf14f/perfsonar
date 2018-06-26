class perfsonar::owamp::config(
  $test_port    = '8760-9960',
  $log_facility = 'local5',
  $log_verbose  = true,
) inherits perfsonar::params {

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
