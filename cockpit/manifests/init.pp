class cockpit {

  package { 'cockpit':
    ensure => installed,
  }

  file { '/etc/cockpit/cockpit.conf':
    ensure  => file,
    content => template('cockpit/cockpit.conf.erb'),
    group   => root,
    owner   => root,
    mode    => '0644',
    require => Package['cockpit'],
  }

  service {'cockpit':
    ensure    => running,
    subscribe => File['/etc/cockpit/cockpit.conf'],
  }

}
