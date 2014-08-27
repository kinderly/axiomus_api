require_relative '../base'

class AxiomusApi::Item < AxiomusApi::Base
  xml_attribute :name, :weight, :quantity, :price
  xml_attribute :expmode, optional: true
end
