class perfsonar::owamp::service(
  $ensure = 'stopped',
  $enable = false,
) inherits perfsonar::params {
  service { 'owamp-server':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['owamp-server'],
  }
}
