class perfsonar::postgresql::service(
  $ensure = 'running',
  $enable = true,
) inherits perfsonar::params {
  service { 'postgresql-9.5':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['postgresql95'],
  }
}
