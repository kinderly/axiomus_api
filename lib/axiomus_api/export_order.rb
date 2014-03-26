class AxiomusApi::ExportOrder < AxiomusApi::BaseOrder
  attr_accessor :export_quantity
  attr_accessor :transit
  attr_accessor :d_date
  attr_accessor :b_time
  attr_accessor :e_time
  attr_accessor :address
end
