require_relative 'regions_order'
require_relative 'regions_pickup_address'

class AxiomusApi::RegionsPickupOrder < AxiomusApi::RegionsOrder

  def initialize
    super
    @address = AxiomusApi::RegionsPickupAddress
  end

end
