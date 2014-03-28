require_relative 'base_order'

class AxiomusApi::RegionsOrder < AxiomusApi::BaseOrder
  xml_field :d_date, xml_type: :attribute
  xml_field :b_time, xml_type: :attribute
  xml_field :e_time, xml_type: :attribute
  xml_field :incl_deliv_sum, xml_type: :attribute, optional: true
  xml_field :address
end
