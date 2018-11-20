class perfsonar::psconfig::pscheduler::config(
  Boolean $snotify = true,
  Enum['INFO', 'DEBUG', 'WARNING', 'ERROR'] $loglvl = 'INFO',
  String $logger = 'Log::Dispatch::FileRotate',
  Array[String] $remote_urls = [],
) {

  $tn = $snotify ? {
    false   => undef,
    default => Service['psconfig-pscheduler-agent'],
  }

  file { '/etc/perfsonar/psconfig/pscheduler-agent-logger.conf':
    ensure  => 'present',
    owner   => 'perfsonar',
    group   => 'perfsonar',
    mode    => '0644',
    content => template("${module_name}/psconfig/pscheduler-agent-logger.conf.erb"),
    require => Package['perfsonar-psconfig-pscheduler'],
    notify  => $tn,
  }

  file { '/etc/perfsonar/psconfig/pscheduler-agent.json':
    ensure  => 'present',
    owner   => 'perfsonar',
    group   => 'perfsonar',
    mode    => '0644',
    content => template("${module_name}/psconfig/pscheduler-agent.json.erb"),
    require => Package['perfsonar-psconfig-pscheduler'],
    notify  => $tn,
  }

}
