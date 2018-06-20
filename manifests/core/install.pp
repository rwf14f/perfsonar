class perfsonar::core::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'perfsonar-core':
    ensure => $ensure,
  }
}
