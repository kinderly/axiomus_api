require_relative 'base_order'
require_relative '../address/post_address'
require_relative '../services/post_services'

class AxiomusApi::PostOrder < AxiomusApi::BaseOrder
  #уточнить
  xml_attribute :b_date, :post_type
  xml_attribute :incl_delivery_sum, optional: true
  xml_field :address, type: AxiomusApi::PostAddress
  xml_field :services, type: AxiomusApi::PostServices

end
