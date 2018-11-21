class perfsonar::apache::service(
  Stdlib::Ensure::Service $ensure = 'running',
  Boolean $enable = true,
) inherits perfsonar::params {
  service { 'httpd':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['httpd'],
  }
}
