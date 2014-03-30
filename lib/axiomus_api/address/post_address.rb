require_relative '../base'

class AxiomusApi::PostAddress < AxiomusApi::Base

  xml_attribute :index, :region, :area, :p_address

end
