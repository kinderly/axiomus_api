require_relative 'base'

class AxiomusApi::RegionsPickupAddress < AxiomusApi::Base
  xml_field :office_code, xml_type: :attribute
end
