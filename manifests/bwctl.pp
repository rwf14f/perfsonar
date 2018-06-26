class perfsonar::bwctl {
  include 'perfsonar::bwctl::install'
  include 'perfsonar::bwctl::config'
  include 'perfsonar::bwctl::service'
  Class['perfsonar::bwctl::install'] -> Class['perfsonar::bwctl::config'] -> Class['perfsonar::bwctl::service']
}
