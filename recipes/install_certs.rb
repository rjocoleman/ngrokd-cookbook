include_recipe 'ngrokd-cookbook::default'

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
