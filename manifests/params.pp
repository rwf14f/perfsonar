class perfsonar::params(
  $ls_cache_daemon_install_ensure        = 'present',
  $ls_cache_daemon_ensure                = 'running',
  $ls_cache_daemon_enable                = true,
  $ls_cache_daemon_loglvl                = 'INFO',
  $ls_cache_daemon_logger                = 'Log::Dispatch::FileRotate',
  $ls_cache_daemon_logfile               = '/var/log/perfsonar/ls_cache_daemon.log',
  $ls_cache_daemon_snotify               = true,
  $ls_cache_daemon_lr_order              = '04',
  $ls_cache_daemon_lr_options            = [ 'weekly', 'compress', 'rotate 50', 'missingok', 'notifempty',
    'postrotate', '  /sbin/service ls_cache_daemon restart > /dev/null 2>/dev/null || true', 'endscript' ],
  $patchdir                              = '/usr/local/share/perfsonar_patches',
  $patchpackage                          = 'patch',
  $patchpackage_ensure                   = 'present',
  $psadmin_group                         = 'wheel',
  $psadmin_user                          = ''
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
  # package list taken from centos6-netinstall.cfg (from the perfsonar netinstall cd)
  # system packages (already installed on standard installation) and
  # packages that are dependencies of packages in this list have been removed from the original list
  # general perfsonar packages
  $install_packages = [
    'perfsonar-toolkit',
    # installed as dependencies, but need them here to get the dependencies in puppet right
    $httpd_package,
    'esmond',
    'ndt-server',
    'npad',
    'nscd',
    'cassandra20',
    $modssl_package,
# don't want to install perfsonar-toolkit-systemenv because it keeps overwriting my configurations during updates
#   'perfsonar-toolkit-systemenv',
#     packages that are installed by perfsonar-toolkit-systemenv:
#       perfsonar-toolkit-ntp
#         configures ntp server (replaces existing config)
#       perfsonar-toolkit-security
#         configures iptables
#       perfsonar-toolkit-service-watcher
#         monitors status of services: mysql, httpd, cassandra, owamp, bwctl, npad, ndt, regular_testing, ls_registration_daemon, ls_cache_daemon, config_daemon
#         according to /opt/perfsonar_ps/toolkit/lib/perfSONAR_PS/NPToolkit/Services/*.pm, the following services need regular restarts: OWAMP, RegularTesting
#       perfsonar-toolkit-sysctl
#         configures /etc/sysctl.conf (appends values)
# unfortunately, with ps 3.5.1.x the main perfsonar-toolkit depends on perfsonar-toolkit-systemenv
# perfsonar-toolkit is also not a meta package, it contains necessary files, so it has to be installed
# the easiest option to avoid the systemenv package is to create dummy rpm with the same name and a higher version number

# are the ones below still required ?
     'device-mapper-multipath',
  ]

  $ls_cache_daemon_packages = [
    'perfsonar-lscachedaemon',
  ]
  # logrotate
  $logrotate_cf = '/etc/logrotate.d/perfsonar'
  $lr_header_order = '01'

  # apache default options
  $hostcert = '/etc/grid-security/hostcert.pem'
  $hostkey = '/etc/grid-security/hostkey.pem'
  $capath = '/etc/grid-security/certificates'
  $clientauth = 'optional'
  $verifydepth = '5'

  # service status defaults
  $config_daemon_ensure = 'running'
  $config_daemon_enable = true
  $config_nic_params = true
  $generate_motd_enable = false
  $htcacheclean_ensure = 'stopped'
  $htcacheclean_enable = false
  $httpd_ensure = 'running'
  $httpd_enable = true
  $multipathd_ensure = 'stopped'
  $multipathd_enable = false
  $ndt_ensure = 'stopped'
  $ndt_enable = false
  $npad_ensure = 'stopped'
  $npad_enable = false
  $nscd_ensure = 'stopped'
  $nscd_enable = false
  $ls_bs_client_ensure = 'stopped'
  $ls_bs_client_enable = false
  $cassandra_ensure = 'running'
  $cassandra_enable = true

}
