require_relative '../base'

class AxiomusApi::Item < AxiomusApi::Base
  xml_element :item

  xml_attribute :name, :weight, :quantity, :price
end
