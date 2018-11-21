class perfsonar::twamp::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'twamp-server':
    ensure => $ensure,
  }

}
