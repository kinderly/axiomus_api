require_relative 'base_order'
require_relative '../items/export_items'
require_relative '../services/export_services'

class AxiomusApi::ExportOrder < AxiomusApi::BaseOrder

  xml_attribute :from_mkad, :garden_ring, optional: true
  xml_attribute :export_quantity, :transit, :d_date, :b_time, :e_time, :address
  xml_field :services, type: AxiomusApi::ExportServices
  xml_field :items, type: AxiomusApi::ExportItems

end
