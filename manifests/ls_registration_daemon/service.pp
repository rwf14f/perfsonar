class perfsonar::ls_registration_daemon::service(
  $ensure = 'running',
  $enable = true,
) inherits perfsonar::params {
  service { 'perfsonar-lsregistrationdaemon':
    ensure     => $ensure,
    enable     => $enable,
    hasrestart => true,
    require    => Package['perfsonar-lsregistrationdaemon'],
  }
}
