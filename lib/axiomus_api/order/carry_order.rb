require_relative 'base_order'
require_relative '../delivset'

class AxiomusApi::CarryOrder < AxiomusApi::BaseOrder

  xml_attribute :office, :incl_deliv_sum, :sms_sender, :sms, optional: true
  xml_attribute :b_date, :e_date
  xml_field :delivset, optional: true, type: AxiomusApi::Delivset
end
