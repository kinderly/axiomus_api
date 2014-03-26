class AxiomusApi::ExportResponse < AxiomusApi::Base
  xml_field :price, xml_type: :attribute
  xml_field :code, xml_type: :attribute
  xml_field :description, xml_type: :text
end
