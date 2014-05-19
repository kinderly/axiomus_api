require_relative('base_order')
require_relative('../address/dpd_address')
require_relative('../services/dpd_services')

class AxiomusApi::DpdOrder < AxiomusApi::BaseOrder

  xml_attribute :b_date, :b_time, :e_time, :post_type
  xml_field :services, type: AxiomusApi::DpdServices
  xml_field :address, type: AxiomusApi::DpdAddress

end
