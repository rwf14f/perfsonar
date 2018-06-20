class perfsonar::apache(
  $localconfig = false,
) inherits perfsonar::params {
  if ! $localconfig {
    include 'perfsonar::apache::install'
    include 'perfsonar::apache::service'
  }
}
