require_relative 'base'

class AxiomusApi::ExportServices < AxiomusApi::Base
  xml_field :transit, xml_type: :attribute, optional: true
  xml_field :warrant, xml_type: :attribute, optional: true
end
