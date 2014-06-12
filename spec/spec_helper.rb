require 'chefspec'
require 'chefspec/berkshelf'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '14.04'

  config.around(:each) do |example|
    VCR.use_cassette('example', record: :once, match_requests_on: [:host, :path]) do
      example.run
    end
  end
end

at_exit { ChefSpec::Coverage.report! }
