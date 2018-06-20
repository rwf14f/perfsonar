class perfsonar::pscheduler::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'pscheduler-server':
    ensure => $ensure,
  }
}
