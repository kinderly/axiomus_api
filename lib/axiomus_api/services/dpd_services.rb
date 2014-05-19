require_relative '../base'

class AxiomusApi::DpdServices < AxiomusApi::Base

  xml_attribute :valuation, :fragile, :cod, :big, :waiting, optional: true

end
