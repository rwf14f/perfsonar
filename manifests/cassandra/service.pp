class perfsonar::cassandra::service(
  $ensure = 'running',
  $enable = true,
) inherits perfsonar::params {
  service { 'cassandra':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['cassandra20'],
  }
}
