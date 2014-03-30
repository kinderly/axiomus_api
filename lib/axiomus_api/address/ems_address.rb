require_relative '../base'

class AxiomusApi::EmsAddress < AxiomusApi::Base

  xml_attribute :index, :area, :street, :house
  xml_attribute :building, :apartment, optional: true

end
