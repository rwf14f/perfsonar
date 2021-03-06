# loglevel is a puppet metaparameter, so have to use something else (loglvl)
class perfsonar::regular_testing::config(
  $libpath    = $::perfsonar::params::regular_testing_libpath,
  $snotify    = $::perfsonar::params::regular_testing_snotify,
  $loglvl     = $::perfsonar::params::regular_testing_loglvl,
  $logger     = $::perfsonar::params::regular_testing_logger,
  $logfile    = $::perfsonar::params::regular_testing_logfile,
  $configfile = $::perfsonar::params::regular_testing_config,
  $esmondroot = $::perfsonar::params::esmond_root,
  $esmondconf = $::perfsonar::params::esmond_conf_path,
) inherits perfsonar::params {
  file { '/usr/local/sbin/puppet_perfsonar_configure_regular_testing':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0750',
    content => template("${module_name}/configure_regular_testing.erb"),
    require => Package['perfsonar-regulartesting'],
  }
  exec { 'run regular testing configuration script':
    command   => '/usr/local/sbin/puppet_perfsonar_configure_regular_testing',
    logoutput => 'on_failure',
    creates   => '/var/lib/perfsonar/regulartesting/.configured.puppet',
    require   => File['/usr/local/sbin/puppet_perfsonar_configure_regular_testing'],
  }
  $tn = $snotify ? {
    false   => undef,
    default => Service['perfsonar-regulartesting'],
  }
  file { '/etc/perfsonar/regulartesting-logger.conf':
    ensure  => 'file',
    owner   => 'perfsonar',
    group   => 'perfsonar',
    mode    => '0644',
    content => template("${module_name}/log4perl-logger.conf.erb"),
    require => Exec['run regular testing configuration script'],
    notify  => $tn,
  }
}
