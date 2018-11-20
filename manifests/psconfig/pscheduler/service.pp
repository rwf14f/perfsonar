class perfsonar::psconfig::pscheduler::service(
  Enum['running', 'stopped'] $ensure = 'running',
  Boolean $enable = true,
) {

  service { 'psconfig-pscheduler-agent':
    ensure     => $ensure,
    enable     => $enable,
    hasrestart => true,
    require    => Package['perfsonar-psconfig-pscheduler'],
  }

}
