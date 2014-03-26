class AxiomusApi::PickupOrder < AxiomusApi::BaseOrder
  attr_accessor :office
  attr_accessor :b_date
  attr_accessor :e_date
  attr_accessor :incl_delivery_sum

  @optional_attributes = [:incl_delivery_sum]
end
