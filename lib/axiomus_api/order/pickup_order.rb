require_relative 'base_order'

class AxiomusApi::PickupOrder < AxiomusApi::BaseOrder

  xml_attribute :office, :incl_delivery_sum, :sms_sender, :sms, optional: true
  xml_attribute :b_date, :e_date
end
