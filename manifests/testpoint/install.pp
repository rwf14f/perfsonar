class perfsonar::testpoint::install(
  Enum['installed', 'present', 'latest'] $ensure = 'present',
) {

  package { 'perfsonar-testpoint':
    ensure => $ensure,
  }

}
