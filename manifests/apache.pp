class perfsonar::apache(
  Boolean $localconfig = false,
) {
  if ! $localconfig {
    include 'perfsonar::apache::install'
    include 'perfsonar::apache::service'
  }
}
