require 'coveralls'
Coveralls.wear!

require 'factory_girl'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

ORDER_MODES = [:new, :update, :new_carry, :update_carry, :new_export, :update_export,
    :new_self_export, :update_self_export, :new_post, :update_post, :new_dpd, :update_dpd, :new_ems, :update_ems,
    :new_region_courier, :update_region_courier, :new_region_pickup, :update_region_pickup]


def order_factory_name(order_mode)
  match = /_(.+)$/.match(order_mode)

  if match.nil?
    :order
  else
    "#{match[1]}_order".to_sym
  end
end

require_relative '../lib/axiomus_api.rb'
require_relative 'support/dummy_data.rb'
require_relative 'support/http_mocking.rb'
require_relative 'factories.rb'
