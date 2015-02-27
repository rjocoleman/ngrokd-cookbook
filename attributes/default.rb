default['ngrokd']['domain'] = nil
default['ngrokd']['path'] = '/etc/ngrokd'
default['ngrokd']['tlskey'] = 'tls.key'
default['ngrokd']['tlscrt'] = 'tls.crt'
default['ngrokd']['log'] = '/var/log/ngrokd.log'
# Set to false if you don't want to source your tls cert from AWS
default['ngrokd']['source_aws'] = true
