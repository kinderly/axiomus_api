class AxiomusApi::Request < AxiomusApi::Base
  xml_element :singleorder
  xml_field :mode
  xml_field :auth
end
