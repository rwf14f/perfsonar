class perfsonar::apache::service(
  $ensure = 'running',
  $enable = true,
) inherits perfsonar::params {
  service { 'httpd':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['httpd'],
  }
}
