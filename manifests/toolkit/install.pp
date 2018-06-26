class perfsonar::toolkit::install(
  $ensure = 'present',
) inherits perfsonar::params {
  package { 'perfsonar-toolkit':
    ensure => $ensure,
  }
}
