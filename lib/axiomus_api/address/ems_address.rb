require_relative '../base'

class AxiomusApi::EmsAddress < AxiomusApi::Base

  xml_attribute :index, :area, :street, :house, :building, :apartment

end
