class perfsonar::ls_registration_daemon::config(
  Boolean $snotify = true,
  Enum['INFO', 'DEBUG', 'WARNING', 'ERROR'] $loglvl = 'INFO',
  String $logger = 'Log::Dispatch::FileRotate',
  String $logfile = '/var/log/perfsonar/lsregistrationdaemon.log',
  Optional[String] $site_name = undef,
  Optional[String] $site_domain = undef,
  Optional[String] $city = undef,
  Optional[String] $region = undef,
  Optional[String] $country = undef,
  Optional[String] $zip_code = undef,
  Optional[Numeric] $latitude = undef,
  Optional[Numeric] $longitude = undef,
  Array $projects = [],
  Array $roles = [],
  Optional[String] $ls_instance = undef,
  Integer[0, default] $check_interval = 3600,
  Boolean $allow_internal_addresses = false,
  Array[Hash] $admins = [],
  Hash[String, Variant[String, Numeric]] $additional_options = {},
) {

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
