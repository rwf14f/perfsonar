class perfsonar::ntp inherits perfsonar::params {

  if $::perfsonar::params::disable_chronyd {
    service { 'chronyd':
      ensure => 'stopped',
      enable => false,
    }
  }
  if $::perfsonar::params::enable_ntpd {
    service { 'ntpd':
      ensure => 'running',
      enable => true,
    }
  }
}
