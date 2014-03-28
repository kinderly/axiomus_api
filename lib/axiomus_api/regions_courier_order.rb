require_relative 'regions_order'
require_relative 'regions_courier_address'

class AxiomusApi::RegionsCourierOrder < AxiomusApi::RegionsOrder

  def initialize
    super
    @address = AxiomusApi::RegionsCourierAddress
  end

end
