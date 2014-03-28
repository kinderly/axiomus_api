require_relative 'item'

class AxiomusApi::ExportItem < AxiomusApi::Item
  xml_field :oid, xml_type: :attribute
end
