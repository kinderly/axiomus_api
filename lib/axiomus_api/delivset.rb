require_relative 'base'
require_relative 'below'

class AxiomusApi::Delivset < AxiomusApi::Base
  xml_attribute :return_price, :above_sum, :above_price
  xml_field_array :below, type: AxiomusApi::Below, max_occurs: 3, optional: true

  def add_below_element
    new_below = AxiomusApi::Below.new
    below << new_below
    new_below
  end
end
