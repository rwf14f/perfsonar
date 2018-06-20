class perfsonar::pscheduler::service(
  $ensure = 'running',
  $enable = true,
) inherits perfsonar::params {
  service { [ 'pscheduler-archiver', 'pscheduler-runner', 'pscheduler-scheduler', 'pscheduler-ticker', ]:
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['pscheduler-server'],
  }
}
