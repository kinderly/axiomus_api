class AxiomusApi::PostOrder < AxiomusApi::BaseOrder
  #уточнить
  attr_accessor :d_date
  attr_accessor :post_type
  attr_accessor :incl_delivery_sum
  attr_accessor :address

  @optional_attributes = [:incl_delivery_sum]
end
