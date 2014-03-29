require_relative '../base'

class AxiomusApi::PostServices < AxiomusApi::Base

  xml_attribute :valuation, :fragile, :code, :big, optional: true

end
