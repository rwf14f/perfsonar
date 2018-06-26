class perfsonar::ls_cache_daemon::service(
  $ensure = 'running',
  $enable = true,
) inherits perfsonar::params {
  service { 'perfsonar-lscachedaemon':
    ensure     => $ensure,
    enable     => $enable,
    hasrestart => true,
    require    => Package['perfsonar-lscachedaemon'],
  }
}
