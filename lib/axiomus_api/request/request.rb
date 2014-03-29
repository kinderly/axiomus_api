require_relative '../base'
require_relative '../base_auth'

class AxiomusApi::Request < AxiomusApi::Base

  xml_element :singleorder
  xml_field :mode
  xml_field :auth, type: AxiomusApi::BaseAuth

end
