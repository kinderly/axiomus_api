require_relative '../base'

class AxiomusApi::RegionsCourierAddress < AxiomusApi::Base

  xml_attribute :region_code, :city_code, :index, :street, :house
  xml_attribute :building, :apartment, optional: true

end
