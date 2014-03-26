class AxiomusApi::ExportOrder < AxiomusApi::BaseOrder
  xml_field :export_quantity, xml_type: :attribute
  xml_field :transit, xml_type: :attribute
  xml_field :d_date, xml_type: :attribute
  xml_field :b_time, xml_type: :attribute
  xml_field :e_time, xml_type: :attribute
  xml_field :address
end
