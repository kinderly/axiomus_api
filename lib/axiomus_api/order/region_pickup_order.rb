require_relative 'region_order'
require_relative '../address/region_pickup_address'

class AxiomusApi::RegionPickupOrder < AxiomusApi::RegionOrder

  xml_field :address, type: AxiomusApi::RegionPickupAddress

end
