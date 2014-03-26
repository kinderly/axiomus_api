class AxiomusApi::PickupOrder < AxiomusApi::BaseOrder
  xml_field :office, xml_type: :attribute, optional: true
  xml_field :b_date, xml_type: :attribute
  xml_field :e_date, xml_type: :attribute
  xml_field :incl_delivery_sum, xml_type: :attribute, optional: true
end
