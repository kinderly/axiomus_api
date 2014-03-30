require_relative '../base'

class AxiomusApi::PostServices < AxiomusApi::Base

  xml_attribute :valuation, :fragile, :cod, :big, optional: true

end
