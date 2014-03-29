require_relative 'base_order'
require_relative 'export_item'

class AxiomusApi::ExportOrder < AxiomusApi::BaseOrder

  xml_attribute :export_quantity, :transit, :d_date, :b_time, :e_time
  xml_field :address

  def create_item
    AxiomusApi::ExportItem.new
  end
end
