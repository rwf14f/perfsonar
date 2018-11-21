class perfsonar::core::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'perfsonar-core':
    ensure => $ensure,
  }

}
