require_relative 'base'

class AxiomusApi::RegionsCourierAddress < AxiomusApi::Base
  xml_field :region_code, xml_type: :attribute
  xml_field :city_code, xml_type: :attribute
  xml_field :index, xml_type: :attribute
  xml_field :street, xml_type: :attribute
  xml_field :house, xml_type: :attribute
  xml_field :building, xml_type: :attribute, optional: true
  xml_field :apartment, optional: true
end
