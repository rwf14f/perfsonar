class perfsonar::ls_cache_daemon::logrotate(
  $logfiles = $::perfsonar::ls_cache_daemon::config::logger,
  $options  = [
    'weekly',
    'compress',
    'rotate 50',
    'missingok',
    'notifempty',
    'postrotate',
    '  /bin/systemctl restart perfsonar-lscachedaemon /dev/null 2>/dev/null || true',
    'endscript'
  ],
  $order    = '04',
) inherits perfsonar::params {
  if $::perfsonar::ls_cache_daemon::config::logger == 'Log::Dispatch::FileRotate' {
    warning("configuring logrotate, but ls_cache_daemon's own logger is configured to do log rotation as well, I hope you know what you're doing")
  }
  concat::fragment { 'ps_logrotate_ls_cache_daemon':
    target  => $::perfsonar::params::logrotate_cf,
    content => template("${module_name}/logrotate_fragment.erb"),
    order   => $order,
    require => Class['perfsonar::ls_cache_daemon::config']
  }
}
