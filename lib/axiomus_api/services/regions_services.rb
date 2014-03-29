require_relative '../base'

class AxiomusApi::RegionsServices < AxiomusApi::Base

  xml_attribute :cheque, :not_open, :extrapack, :big, optional: true

end
