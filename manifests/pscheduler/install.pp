class perfsonar::pscheduler::install(
  Enum['installed', 'present', 'latest'] $ensure = 'present',
) {

  package { 'pscheduler-server':
    ensure => $ensure,
  }

}
