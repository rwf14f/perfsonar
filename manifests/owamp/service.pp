class perfsonar::owamp::service(
  Enum['running', 'stopped'] $ensure = 'stopped',
  Boolean $enable = false,
) {

  service { 'owamp-server':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['owamp-server'],
  }

}
