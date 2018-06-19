class perfsonar::mesh_config::install(
  $ensure = $::perfsonar::params::mesh_config_install_ensure,
) inherits perfsonar::params {
  package { 'perfsonar-meshconfig-agent':
    ensure => $ensure,
  }
}
