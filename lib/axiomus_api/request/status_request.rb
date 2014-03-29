require_relative 'request'

class AxiomusApi::StatusRequest < AxiomusApi::Request
  xml_field :okey
end
