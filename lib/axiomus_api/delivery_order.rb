class AxiomusApi::DeliveryOrder < AxiomusApi::BaseOrder
  xml_field :address, xml_type: :attribute
  xml_field :d_date, xml_type: :attribute
  xml_field :b_time, xml_type: :attribute
  xml_field :e_time, xml_type: :attribute
  xml_field :incl_delivery_sum, xml_type: :attribute, optional: true
end
