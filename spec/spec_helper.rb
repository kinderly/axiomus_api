require 'coveralls'
require "codeclimate-test-reporter"

Coveralls.wear!
CodeClimate::TestReporter.start

require_relative '../lib/axiomus_api.rb'
require_relative 'support/dummy_data.rb'
require_relative 'support/http_mocking.rb'
