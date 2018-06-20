class perfsonar::testpoint::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'perfsonar-testpoint':
    ensure => $ensure,
  }
}
