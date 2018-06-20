class perfsonar::cassandra::install(
  $ensure = 'present',
) inherits perfsonar::params {
  # cassandra requires java, but the package doesn't depend on it
  package { [ 'java-1.7.0-openjdk', 'cassandra20' ]:
    ensure => $ensure,
  }
}
