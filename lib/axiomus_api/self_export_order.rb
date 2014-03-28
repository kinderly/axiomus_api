require_relative 'base_order'

class AxiomusApi::SelfExportOrder < AxiomusApi::BaseOrder
  xml_field :car, xml_type: :attribute
  xml_field :d_date, xml_type: :attribute
  xml_field :b_time, xml_type: :attribute
  xml_field :e_time, xml_type: :attribute
end
