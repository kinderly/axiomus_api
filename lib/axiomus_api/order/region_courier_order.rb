require_relative 'region_order'
require_relative '../address/region_courier_address'

class AxiomusApi::RegionCourierOrder < AxiomusApi::RegionOrder

  xml_field :address, type: AxiomusApi::RegionCourierAddress

end
