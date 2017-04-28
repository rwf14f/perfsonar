class perfsonar::logrotate_all {
  include 'perfsonar::logrotate'
  if $::perfsonar_version and versioncmp($::perfsonar_version, '4.0') < 0 {
    include 'perfsonar::regular_testing::logrotate'
  }
  include 'perfsonar::ls_registration_daemon::logrotate'
  include 'perfsonar::ls_cache_daemon::logrotate'
}
