#Module to provision a apache web server in centos, rhel and ubuntu
class apache {
  case $::operatingsystem {
    "ubuntu": {
      $packagename = "apache2"
      $servicename = "apache2"
    }
    "centos", "rhel": {
      $packagename = "httpd"
      $servicename = "httpd"
    }
    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }

  #Ensure Apache is installed
  package { 'apache':
    name    =>    $packagename,
    ensure  =>    installed,
  }

  #Ensure Apache is running
  service { 'apache':
    name      =>  $servicename,
    ensure    =>  running,
    require   =>  Package['apache'],
  }


}

