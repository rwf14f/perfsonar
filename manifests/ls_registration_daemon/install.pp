class perfsonar::ls_registration_daemon::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'perfsonar-lsregistrationdaemon':
    ensure => $ensure,
    before => File['/etc/perfsonar/lsregistrationdaemon-logger.conf'],
  }
}
