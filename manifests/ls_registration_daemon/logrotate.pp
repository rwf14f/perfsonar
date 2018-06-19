class perfsonar::ls_registration_daemon::logrotate(
  $logfiles = $::perfsonar::ls_registration_daemon::config::logfile,
  $options  = [
    'weekly',
    'compress',
    'rotate 50',
    'missingok',
    'notifempty',
    'postrotate',
    '  /bin/systemctl restart perfsonar-lsregistrationdaemon > /dev/null 2>/dev/null || true',
    'endscript'
  ],
  $order    = '03',
) inherits perfsonar::params {
  if $::perfsonar::ls_registration_daemon::config::logger == 'Log::Dispatch::FileRotate' {
    warning("configuring logrotate, but ls_registration_daemon's own logger is configured to do log rotation as well, I hope you know what you're doing")
  }
  concat::fragment { 'ps_logrotate_ls_registration_daemon':
    target  => $::perfsonar::params::logrotate_cf,
    content => template("${module_name}/logrotate_fragment.erb"),
    order   => $order,
    require => Class['perfsonar::ls_registration_daemon::config']
  }
}
