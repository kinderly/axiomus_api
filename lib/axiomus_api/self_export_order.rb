require_relative 'base_order'

class AxiomusApi::SelfExportOrder < AxiomusApi::BaseOrder

  xml_attribute :car, :d_date, :b_time, :e_time

end

