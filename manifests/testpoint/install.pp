class perfsonar::testpoint::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'perfsonar-testpoint':
    ensure => $ensure,
  }

}
