class perfsonar::owamp::service(
  Stdlib::Ensure::Service $ensure = 'stopped',
  Boolean $enable = false,
) {

  service { 'owamp-server':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['owamp-server'],
  }

}
