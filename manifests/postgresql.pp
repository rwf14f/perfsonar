class perfsonar::postgresql(
  $localconfig = false,
) inherits perfsonar::params {
  if ! $localconfig {
    include 'perfsonar::postgresql::install'
    include 'perfsonar::postgresql::service'
  }
}
