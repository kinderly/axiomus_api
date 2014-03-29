require_relative 'regions_order'
require_relative '../address/regions_pickup_address'

class AxiomusApi::RegionsPickupOrder < AxiomusApi::RegionsOrder

  xml_field :address, type: AxiomusApi::RegionsPickupAddress

end
