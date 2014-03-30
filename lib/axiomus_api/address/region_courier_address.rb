require_relative '../base'

class AxiomusApi::RegionCourierAddress < AxiomusApi::Base

  xml_attribute :region_code, :city_code, :index, :street, :house
  xml_attribute :building, :apartment, optional: true

end
