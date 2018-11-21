class perfsonar::ls_registration_daemon::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'perfsonar-lsregistrationdaemon':
    ensure => $ensure,
    before => File['/etc/perfsonar/lsregistrationdaemon-logger.conf'],
  }

}
