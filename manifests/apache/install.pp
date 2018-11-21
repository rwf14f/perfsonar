class perfsonar::apache::install(
  Perfsonar::Installed $ensure = 'present',
) {

  package { 'httpd':
    ensure => $ensure,
  }

}
