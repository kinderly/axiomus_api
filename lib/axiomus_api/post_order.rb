require_relative 'base_order'
require_relative 'post_address'
require_relative 'post_services'

class AxiomusApi::PostOrder < AxiomusApi::BaseOrder
  #уточнить
  xml_field :d_date, xml_type: :attribute
  xml_field :post_type, xml_type: :attribute
  xml_field :incl_delivery_sum, xml_type: :attribute, optional: true
  xml_field :address

  def initialize
    super
    @address = AxiomusApi::PostAddress.new
    @services = AxiomusApi::PostServices.new
  end
end
