class perfsonar::owamp::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'owamp-server':
    ensure => $ensure,
  }
}
