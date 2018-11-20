class perfsonar::psconfig::pscheduler::install(
  Enum['installed', 'present', 'latest'] $ensure = 'present',
) {

  package { 'perfsonar-psconfig-pscheduler':
    ensure => $ensure,
  }

}
