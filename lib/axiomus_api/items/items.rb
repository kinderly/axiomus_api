require_relative '../base'
require_relative '../item/item'

class AxiomusApi::Items < AxiomusApi::Base

  xml_field_array :item, type: AxiomusApi::Item

  def add_item
    new_item = AxiomusApi::Item.new
    item << new_item
    new_item
  end

end
