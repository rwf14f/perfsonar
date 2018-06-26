class perfsonar::owamp {
  include 'perfsonar::owamp::install'
  include 'perfsonar::owamp::config'
  include 'perfsonar::owamp::service'
  Class['perfsonar::owamp::install'] -> Class['perfsonar::owamp::config'] -> Class['perfsonar::owamp::service']
}
