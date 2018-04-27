class perfsonar {
  include 'perfsonar::install'
  include 'perfsonar::config'
  include 'perfsonar::service'
  include 'perfsonar::apache'
  include 'perfsonar::esmond'
  if $::perfsonar_version and versioncmp($::perfsonar_version, '4.0') < 0 {
    include 'perfsonar::regular_testing'
  }
  include 'perfsonar::mesh_config'
  include 'perfsonar::owamp'
  include 'perfsonar::bwctl'
  include 'perfsonar::ls_registration_daemon'
  include 'perfsonar::ls_cache_daemon'
  Class['perfsonar::install'] -> Class['perfsonar::config'] -> Class['perfsonar::service']
}
