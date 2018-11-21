class perfsonar::twamp::service(
  Stdlib::Ensure::Service $ensure = 'stopped',
  Boolean $enable = false,
) {

  service { 'twamp-server':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['twamp-server'],
  }

}
