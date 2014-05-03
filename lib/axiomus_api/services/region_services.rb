require_relative '../base'

class AxiomusApi::RegionServices < AxiomusApi::Base

  xml_attribute :cheque, :not_open, :extrapack, :big, :part_return, optional: true

end
