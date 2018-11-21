class perfsonar::cassandra::install(
  Perfsonar::Installed $ensure = 'present',
) {

  # cassandra requires java, but the package doesn't depend on it
  # (cassandra is a dependency of esmond which also depends on java)
  package { [ 'java-1.7.0-openjdk', 'cassandra20' ]:
    ensure => $ensure,
  }

}
