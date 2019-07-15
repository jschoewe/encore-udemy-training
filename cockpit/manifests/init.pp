class cockpit {

  package { 'cockpit':
    ensure => installed,
  }

  service {'cockpit':
    ensure  => running,
    require => Package['cockpit'],
  }

  file { '/etc/cockpit/cockpit.conf':
    ensure  => file,
    content => template('cockpit/cockpit.conf.erb'),
    group   => root,
    owner   => root,
    mode    => '0644',
    require => Service['cockpit'],
  }

}
