require_relative '../base'

class AxiomusApi::ExportServices < AxiomusApi::Base

  xml_attribute :transit, :warrant, optional: true

end
