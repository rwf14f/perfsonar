class perfsonar::owamp::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'owamp-server':
    ensure => $ensure,
  }

}
