class perfsonar::mesh_config::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'perfsonar-meshconfig-agent':
    ensure => $ensure,
  }
}
