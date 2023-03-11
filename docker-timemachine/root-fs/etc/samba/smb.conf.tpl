[global]
  # Basic Samba configuration
  server role = standalone server
  passdb backend = tdbsam
  obey pam restrictions = yes
  security = user
  printcap name = /dev/null
  load printers = no
  socket options = TCP_NODELAY IPTOS_LOWDELAY SO_RCVBUF=524288 SO_SNDBUF=524288
  server string = Samba Server %v
  map to guest = bad user
  dns proxy = no
  wide links = yes
  follow symlinks = yes
  unix extensions = no
  acl allow execute always = yes
  log file = /var/log/samba/%m.log
  max log size = 1000
  max disk size = ${SMB_MAX_SIZE_MB}
  smb ports = ${SMB_PORTS}

  # Special configuration for Apple's Time Machine
  fruit:model = MacPro
  fruit:advertise_fullsync = true
  fruit:aapl = yes
  fruit:time machine = yes

  # Sharing configs
  browsable = yes
  read only = no
  writable = yes
  durable handles = yes
  kernel oplocks = no
  kernel share modes = no
  posix locking = no
  vfs objects = catia fruit streams_xattr
  ea support = yes
  inherit acls = yes


  veto files = /._*/.apdisk/.AppleDouble/.DS_Store/.TemporaryItems/.Trashes/desktop.ini/ehthumbs.db/Network Trash Folder/Temporary Items/Thumbs.db/
  delete veto files = yes

  valid users = ${SMB_USER}

  admin users = ${SMB_USER}


[${SMB_NAME}]
  path = /share
