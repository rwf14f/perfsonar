class perfsonar::psconfig::pscheduler::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'perfsonar-psconfig-pscheduler':
    ensure => $ensure,
  }

}
