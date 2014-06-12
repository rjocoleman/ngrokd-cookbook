package 'ngrok-server'

directory node['ngrokd']['path']

tlskey_path = ::File.join(node['ngrokd']['path'], node['ngrokd']['tlskey'])
file tlskey_path do
  owner 'root'
  group 'root'
  mode '600'
  content citadel['tls.key']
end

tlscrt_path = ::File.join(node['ngrokd']['path'], node['ngrokd']['tlscrt'])
file tlscrt_path do
  owner 'root'
  group 'root'
  mode '600'
  content citadel['tls.crt']
end

template '/etc/init/ngrokd.conf' do
  source 'ngrokd.upstart.conf.erb'
  mode '0644'
  variables(
    domain: node['ngrokd']['domain'],
    tlskey: tlskey_path,
    tlscrt: tlscrt_path,
    log: node['ngrokd']['log']
  )
end

service 'ngrokd' do
  provider Chef::Provider::Service::Upstart
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
