class perfsonar::apache::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'httpd':
    ensure => $ensure,
  }
}
