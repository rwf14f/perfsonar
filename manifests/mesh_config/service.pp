class perfsonar::mesh_config::service(
  $ensure = 'running',
  $enable = true,
) inherits perfsonar::params {
  service { 'perfsonar-meshconfig-agent':
    ensure     => $ensure,
    enable     => $enable,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['perfsonar-meshconfig-agent'],
  }
}
