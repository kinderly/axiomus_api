require_relative('base_order')
require_relative('../address/dpd_address')

class AxiomusApi::DpdOrder < AxiomusApi::BaseOrder

  xml_attribute :d_date, :b_time, :e_time, :post_type
  xml_field :services, type: AxiomusApi::PostServices
  xml_attribute :address, type: AxiomusApi::DpdAddress

end
