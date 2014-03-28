require_relative 'base_order'

class AxiomusApi::EmsOrder < AxiomusApi::BaseOrder
  #уточнить
  xml_field :d_date, xml_type: :attribute
  xml_field :incl_delivery_sum, xml_type: :attribute, optional: true
  xml_field :address

  def initialize
    super
    @address = AxiomusApi::EmsAddress.new
    @services = AxiomusApi::PostServices
  end
end
