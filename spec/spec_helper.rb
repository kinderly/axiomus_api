require 'coveralls'
require 'codeclimate-test-reporter'
require 'factory_girl'

Coveralls.wear!
CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

require_relative '../lib/axiomus_api.rb'
require_relative 'support/dummy_data.rb'
require_relative 'support/http_mocking.rb'
require_relative 'factories.rb'
