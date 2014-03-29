require_relative '../base'

class AxiomusApi::PostAddress < AxiomusApi::Base

  xml_field :index, :region, :area, :p_address

end
