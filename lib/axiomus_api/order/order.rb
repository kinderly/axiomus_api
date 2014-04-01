require_relative 'base_order'

class AxiomusApi::Order < AxiomusApi::BaseOrder

  xml_attribute :address, :d_date, :b_time, :e_time, :city
  xml_attribute :incl_deliv_sum, :from_mkad, :garden_ring, :sms_sender, :sms, optional: true

end
