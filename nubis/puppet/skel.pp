# This application specific puppet file is where we install miscelanous packages etc...

exec { "apt-get update":
    command => "/usr/bin/apt-get update",
}

package { 'makepasswd':
  ensure => '1.10-9',
  require  => Exec['apt-get update'],
}

package { 'git':
  ensure => present,
  require  => Exec['apt-get update'],
}
 
exec { "set ip forwarding":
	command => "/bin/echo 1 > /proc/sys/net/ipv4/ip_forward",
}

