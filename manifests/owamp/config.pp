class perfsonar::owamp::config(
  Tuple[Integer[1024,65535], Integer[1024,65535]] $test_port = [8760, 9960],
  String $log_facility = 'local5',
  Boolean $log_verbose = true,
  Array[Perfsonar::Limits] $limits = [{
      name            => 'root',
      disk            => 0,
      bandwidth       => 0,
      delete_on_fetch => 'on',
    }, {
      name      => 'regular',
      parent    => 'root',
      disk      => '10G',
      bandwidth => '20M',
    },
  ],
  String $default = 'regular',
) {

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
