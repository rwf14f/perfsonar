class perfsonar::postgresql::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'postgresql95':
    ensure => $ensure,
  }
}
