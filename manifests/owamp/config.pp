class perfsonar::owamp::config(
  Tuple[Stdlib::Port::Unprivileged, Stdlib::Port::Unprivileged] $test_port = [8760, 9960],
  String $log_facility = 'local5',
  Boolean $log_verbose = true,
  String $user = 'owamp',
  String $group = 'owamp',
  Stdlib::Absolutepath $datadir = '/var/lib/owamp',
  Optional[Float[1.0, 10.0]] $diskfudge = 3.0,
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

  # owamp and twamp configurations are very simiar,
  # therefore they use the same configuration file templates
  file { '/etc/owamp-server/owamp-server.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/towamp-server.conf.erb"),
    require => Package['owamp-server'],
    notify  => Service['owamp-server'],
  }
  file { '/etc/owamp-server/owamp-server.limits':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/towamp-server.limits.erb"),
    require => Package['owamp-server'],
    notify  => Service['owamp-server'],
  }
}
