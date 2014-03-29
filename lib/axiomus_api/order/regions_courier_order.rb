require_relative 'regions_order'
require_relative '../address/regions_courier_address'

class AxiomusApi::RegionsCourierOrder < AxiomusApi::RegionsOrder

  xml_field :address, type: AxiomusApi::RegionsCourierAddress

end
