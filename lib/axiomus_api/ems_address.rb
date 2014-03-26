class AxiomusApi::EmsAddress < AxiomusApi::Base
  xml_field :index, xml_type: :attribute
  xml_field :area, xml_type: :attribute
  xml_field :street, xml_type: :attribute
  xml_field :house, xml_type: :attribute
  xml_field :building, xml_type: :attribute
  xml_field :apartment, xml_type: :attribute
end
