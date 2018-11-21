class perfsonar::ls_registration_daemon::service(
  Stdlib::Ensure::Service $ensure = 'running',
  Boolean $enable = true,
) {

  service { 'perfsonar-lsregistrationdaemon':
    ensure     => $ensure,
    enable     => $enable,
    hasrestart => true,
    require    => Package['perfsonar-lsregistrationdaemon'],
  }

}
