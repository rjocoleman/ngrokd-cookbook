require_relative '../../spec_helper'

describe 'ngrokd::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set['citadel']['access_key_id'] = 'foo'
      node.set['citadel']['secret_access_key'] = 'bar'
      node.set['citadel']['bucket'] = 'fake-s3-bucket'
      node.set['ngrokd']['domain'] = 'example.com'
    end.converge(described_recipe)
  end

  it 'installs ngrok-server' do
    expect(chef_run).to install_package('ngrok-server')
  end

  it 'creates ngrokd directory' do
    expect(chef_run).to create_directory('/etc/ngrokd')
  end

  it 'creates tls.crt' do
    expect(chef_run).to render_file('/etc/ngrokd/tls.crt')
  end

  it 'creates tls.key' do
    expect(chef_run).to render_file('/etc/ngrokd/tls.key')
  end

  it 'creates ngrokd upstart conf' do
    expect(chef_run).to create_template('/etc/init/ngrokd.conf')
  end

  it 'enables and starts ngrokd service' do
    expect(chef_run).to enable_service('ngrokd')
    expect(chef_run).to start_service('ngrokd')
  end

end
