class perfsonar::ls_cache_daemon::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'perfsonar-lscachedaemon':
    ensure => $ensure,
    before => File['/etc/perfsonar/lscachedaemon-logger.conf'],
  }
}
