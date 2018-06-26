class perfsonar::ls_cache_daemon::config(
  $snotify = true,
  $loglvl  = 'INFO',
  $logger  = 'Log::Dispatch::FileRotate',
  $logfile = '/var/log/perfsonar/lscachedaemon.log',
) inherits perfsonar::params {
  $tn = $snotify ? {
    false   => undef,
    default => Service['perfsonar-lscachedaemon'],
  }
  file { '/etc/perfsonar/lscachedaemon-logger.conf':
    ensure  => 'file',
    owner   => 'perfsonar',
    group   => 'perfsonar',
    mode    => '0644',
    content => template("${module_name}/log4perl-logger.conf.erb"),
    notify  => $tn,
  }
}
