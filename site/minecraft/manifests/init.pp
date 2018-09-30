class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
   }
   
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://s3.amazoneaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar',
  }
  
  package {'java':
    ensure => present,
  }
  
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  
  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
}
