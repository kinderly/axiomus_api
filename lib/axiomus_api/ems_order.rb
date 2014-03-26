class AxiomusApi::PostOrder < AxiomusApi::BaseOrder
  #уточнить
  xml_field :d_date, xml_type: :attribute
  xml_field :incl_delivery_sum, xml_type: :attribute, optional: true
  xml_field :address
end
