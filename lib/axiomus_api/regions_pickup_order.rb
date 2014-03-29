require_relative 'regions_order'
require_relative 'regions_pickup_address'

class AxiomusApi::RegionsPickupOrder < AxiomusApi::RegionsOrder

  def initialize
    super
    @address = AxiomusApi::RegionsPickupAddress
  end

  def validate!
    if super
      if !@address.is_a?(AxiomusApi::RegionsPickupAddress)
        @validation_errors = 'field address must be of type AxiomusApi::RegionsPickupAddress'
      else
        true
      end
    else
      false
    end
  end
end
