class perfsonar::cassandra::service(
  Stdlib::Ensure::Service $ensure = 'running',
  Boolean $enable = true,
) {

  service { 'cassandra':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['cassandra20'],
  }

}
