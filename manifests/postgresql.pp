class perfsonar::postgresql(
  Boolean $localconfig = false,
) {
  if ! $localconfig {
    include 'perfsonar::postgresql::install'
    include 'perfsonar::postgresql::service'
  }
}
