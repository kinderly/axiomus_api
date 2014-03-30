require_relative '../base'

class AxiomusApi::RegionServices < AxiomusApi::Base

  xml_attribute :cheque, :not_open, :extrapack, :big, optional: true

end
