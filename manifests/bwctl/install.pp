class perfsonar::bwctl::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'bwctl-server':
    ensure => $ensure,
  }
}
