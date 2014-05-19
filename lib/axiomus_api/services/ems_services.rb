require_relative '../base'

class AxiomusApi::EmsServices < AxiomusApi::Base

  xml_attribute :valuation, :fragile, :cod, :big, optional: true

end
