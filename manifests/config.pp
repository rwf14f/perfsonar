class perfsonar::config(
  $owamp_test_port = '8760-9960',
  $log_local5_file = '/var/log/perfsonar/owamp_bwctl.log',
  $syslog_pid_file = '/var/run/syslogd.pid',
) inherits perfsonar::params {

  $log_local5_file_ensure = $log_local5_file ? {
    ''      => 'absent',
    false   => 'absent',
    undef   => 'absent',
    default => 'present',
  }
  file { '/etc/rsyslog.d/owamp_bwctl-syslog.conf':
    ensure  => $log_local5_file_ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "local5.*  -${log_local5_file}\n",
  }
  file { '/etc/logrotate.d/perfsonar_syslog':
    ensure  => $log_local5_file_ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "${log_local5_file} {\n  sharedscripts\n  postrotate\n    /bin/kill -HUP `cat ${syslog_pid_file} 2> /dev/null` 2> /dev/null || true\n  endscript\n}\n",
  }
  if $log_local5_file_ensure == 'present' {
    # don't delete the log file if the configuration changes
    file { $log_local5_file:
      ensure => 'present',
      owner  => 'perfsonar',
      group  => 'perfsonar',
      mode   => '0644',
    }
  }
}
