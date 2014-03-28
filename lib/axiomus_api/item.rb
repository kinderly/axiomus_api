require_relative 'base'

class AxiomusApi::Item < AxiomusApi::Base
  xml_element :item

  xml_field :name, xml_type: :attribute
  xml_field :weight, xml_type: :attribute
  xml_field :quantity, xml_type: :attribute
  xml_field :price, xml_type: :attribute
end
