class perfsonar::pscheduler::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'pscheduler-server':
    ensure => $ensure,
  }

}
