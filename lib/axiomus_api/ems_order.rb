require_relative 'base_order'

class AxiomusApi::EmsOrder < AxiomusApi::BaseOrder
  #уточнить
  xml_attribute :d_date
  xml_attribute :incl_delivery_sum, optional: true
  xml_field :address

  def initialize
    super
    @address = AxiomusApi::EmsAddress.new
    @services = AxiomusApi::PostServices
  end
end
