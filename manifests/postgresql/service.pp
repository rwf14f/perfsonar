class perfsonar::postgresql::service(
  Stdlib::Ensure::Service $ensure = 'running',
  Boolean $enable = true,
) {
  service { 'postgresql-9.5':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['postgresql95-server'],
  }
}
