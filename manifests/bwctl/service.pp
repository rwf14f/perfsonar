class perfsonar::bwctl::service(
  $ensure = 'stopped',
  $enable = false,
) inherits perfsonar::params {
  service { 'bwctl-server':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['bwctl-server'],
  }
}
