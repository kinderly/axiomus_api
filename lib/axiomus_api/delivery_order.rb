require_relative 'base_order'

class AxiomusApi::DeliveryOrder < AxiomusApi::BaseOrder

  xml_attribute :address, :d_date, :b_date, :b_time, :e_time
  xml_attribute :incl_delivery_sum, optional: true

  def initialize
    super
    @services = AxiomusApi::Services.new
  end
end
