class perfsonar::bwctl::config(
  $iperf_port  = '5001-5300',
  $nuttcp_port = '5301-5600',
  $owamp_port  = '5601-5900',
  $peer_port   = '6001-6200',
  $test_port   = '5202-5900',
) inherits perfsonar::params {

  file { '/etc/bwctl-server/bwctl-server.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/bwctl-server.conf.erb"),
    require => Package['bwctl-server'],
    notify  => Service['bwctl-server'],
  }
}
