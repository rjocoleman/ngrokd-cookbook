require_relative '../../spec_helper'

describe 'ngrokd-cookbook::install_certs' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['citadel']['access_key_id'] = 'foo'
      node.set['citadel']['secret_access_key'] = 'bar'
      node.set['citadel']['bucket'] = 'fake-s3-bucket'
    end.converge(described_recipe)
  end

  it 'creates tls.crt' do
    expect(chef_run).to render_file('/etc/ngrokd/tls.crt')
  end

  it 'creates tls.key' do
    expect(chef_run).to render_file('/etc/ngrokd/tls.key')
  end
end
