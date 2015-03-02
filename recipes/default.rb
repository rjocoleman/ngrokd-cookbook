package 'ngrok-server'

directory node['ngrokd']['path']

tlscrt_path = ::File.join(node['ngrokd']['path'], node['ngrokd']['tlscrt'])
tlskey_path = ::File.join(node['ngrokd']['path'], node['ngrokd']['tlskey'])

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
