require_relative 'ems_address'

class AxiomusApi::DpdAddress < AxiomusApi::EmsAddress

  xml_attribute :region
  xml_attribute :carrymode, optional: true

end
