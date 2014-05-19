require_relative 'base_order'
require_relative '../address/ems_address'
require_relative '../services/ems_services'

class AxiomusApi::EmsOrder < AxiomusApi::BaseOrder

  xml_attribute :b_date
  xml_attribute :incl_deliv_sum, optional: true
  xml_field :address, type: AxiomusApi::EmsAddress
  xml_field :services, type: AxiomusApi::EmsServices

end
