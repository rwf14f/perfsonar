class perfsonar::ls_registration_daemon::install(
  Enum['installed', 'present', 'latest'] $ensure = 'present',
) {

  package { 'perfsonar-lsregistrationdaemon':
    ensure => $ensure,
    before => File['/etc/perfsonar/lsregistrationdaemon-logger.conf'],
  }

}
