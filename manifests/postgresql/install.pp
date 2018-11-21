class perfsonar::postgresql::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'postgresql95-server':
    ensure => $ensure,
  }

}
