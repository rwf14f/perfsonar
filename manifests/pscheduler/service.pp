class perfsonar::pscheduler::service(
  Enum['running', 'stopped'] $ensure = 'running',
  Boolean $enable = true,
) {

  service { [ 'pscheduler-archiver', 'pscheduler-runner', 'pscheduler-scheduler', 'pscheduler-ticker', ]:
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['pscheduler-server'],
  }

}
