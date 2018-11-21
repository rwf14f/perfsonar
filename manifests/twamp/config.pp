class perfsonar::twamp::config(
  Tuple[Stdlib::Port::Unprivileged, Stdlib::Port::Unprivileged] $test_port = [18760, 19960],
  String $log_facility = 'local5',
  Boolean $log_verbose = true,
  String $user = 'twamp',
  String $group = 'twamp',
  Stdlib::Absolutepath $datadir = '/var/lib/twamp',
  Optional[Float[1.0, 10.0]] $diskfudge = undef,
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
  file { '/etc/twamp-server/twamp-server.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/towamp-server.conf.erb"),
    require => Package['twamp-server'],
    notify  => Service['twamp-server'],
  }
  file { '/etc/twamp-server/twamp-server.limits':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/towamp-server.limits.erb"),
    require => Package['twamp-server'],
    notify  => Service['twamp-server'],
  }
}
