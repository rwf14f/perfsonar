class perfsonar::params(
  $patchdir             = '/usr/local/share/perfsonar_patches',
  $patchpackage         = 'patch',
  $patchpackage_ensure  = 'present',
  $psadmin_group        = 'wheel',
  $psadmin_user         = ''
) {
  # os specifics
  case $::osfamily {
    'RedHat': {
      $modssl_package   = 'mod_ssl'
      $httpd_package    = 'httpd'
      $httpd_service    = 'httpd'
      $httpd_hasrestart = true
      $httpd_hasstatus  = true
      $httpd_dir        = '/etc/httpd'
      $mod_dir          = "${httpd_dir}/conf.d"
      $conf_dir         = "${httpd_dir}/conf.d"
    }
    default: {
      fail("osfamily ${::osfamily} is not supported")
    }
  }


  # options valid after move to 4.0
  # logrotate
  $logrotate_cf = '/etc/logrotate.d/perfsonar'
  $lr_header_order = '01'

}
