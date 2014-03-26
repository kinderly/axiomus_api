class AxiomusApi::RegionsOrder < AxiomusApi::BaseOrder
  attr_accessor :d_date
  attr_accessor :b_time
  attr_accessor :e_time
  attr_accessor :incl_deliv_sum
  attr_accessor :address

  @optional_attributes = [:incl_deliv_sum]
end
