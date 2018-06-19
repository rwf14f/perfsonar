class perfsonar::ls_registration_daemon::config(
  $snotify      = true,
  $loglvl       = 'INFO',
  $logger       = 'Log::Dispatch::FileRotate',
  $logfile      = '/var/log/perfsonar/ls_registration_daemon.log',
  $admins       = {},
  $options      = {},
  $roles        = [],
  $projects     = [],
) inherits perfsonar::params {
  $tn = $snotify ? {
    false   => undef,
    default => Service['perfsonar-lsregistrationdaemon'],
  }
  file { '/etc/perfsonar/lsregistrationdaemon-logger.conf':
    ensure  => 'present',
    owner   => 'perfsonar',
    group   => 'perfsonar',
    mode    => '0644',
    content => template("${module_name}/log4perl-logger.conf.erb"),
    require => Package['perfsonar-lsregistrationdaemon'],
    notify  => $tn,
  }

  $default_options = {
    check_interval           => 3600,
    allow_internal_addresses => 0,
  }
  $lsrd_options = merge($default_options, $options)
  file { '/etc/perfsonar/lsregistrationdaemon.conf':
    ensure  => 'present',
    owner   => 'perfsonar',
    group   => 'perfsonar',
    mode    => '0644',
    content => template("${module_name}/lsregistrationdaemon.conf.erb"),
    require => Package['perfsonar-lsregistrationdaemon'],
    notify  => $tn,
  }
}
