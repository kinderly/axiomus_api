require_relative 'base_order'
require_relative 'post_address'
require_relative 'post_services'

class AxiomusApi::PostOrder < AxiomusApi::BaseOrder
  #уточнить
  xml_attribute :d_date, :post_type
  xml_attribute :incl_delivery_sum, optional: true
  xml_field :address, type: AxiomusApi::PostAddress
  xml_field :services, type: AxiomusApi::PostServices

end
