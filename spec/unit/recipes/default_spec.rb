require_relative '../../spec_helper'

describe 'ngrokd-cookbook::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  it 'installs ngrok-server' do
    expect(chef_run).to install_package('ngrok-server')
  end

  it 'creates ngrokd directory' do
    expect(chef_run).to create_directory('/etc/ngrokd')
  end

  it 'creates ngrokd upstart conf' do
    expect(chef_run).to create_template('/etc/init/ngrokd.conf')
  end

  it 'enables and starts ngrokd service' do
    expect(chef_run).to enable_service('ngrokd')
    expect(chef_run).to start_service('ngrokd')
  end
end
