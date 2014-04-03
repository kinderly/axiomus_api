require_relative '../base'
require_relative '../item/export_item'

class AxiomusApi::ExportItems < AxiomusApi::Base

  xml_field_array :item, type: AxiomusApi::ExportItem

  def add_item
    new_item = AxiomusApi::ExportItem.new
    item << new_item
    new_item
  end
end
