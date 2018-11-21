class perfsonar::owamp::install(
  Enum['installed', 'present', 'latest'] $ensure = 'present',
) {

  package { 'owamp-server':
    ensure => $ensure,
  }

}
