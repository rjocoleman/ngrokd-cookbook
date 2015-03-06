name 'ngrokd-cookbook'
maintainer 'Robert Coleman'
maintainer_email 'github@robert.net.nz'
license 'MIT'
description 'Installs/Configures ngrokd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.2'
recipe 'default', 'Installs ngrok-server with /etc directory and upstart config'
recipe 'install_certs', 'Installs tls certs from AWS S3 via the citadel cookbook'

supports 'ubuntu'

depends 'citadel'
