class perfsonar::psconfig::pscheduler::service(
  Enum['running', 'stopped'] $ensure = 'running',
  Boolean $enable = true,
) {

  service { 'psconfig-pscheduler-agent':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['perfsonar-psconfig-pscheduler'],
  }

}
