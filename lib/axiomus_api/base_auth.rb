require_relative 'base'

class AxiomusApi::BaseAuth < AxiomusApi::Base
  xml_attribute :ukey
end

class AxiomusApi::Auth < AxiomusApi::BaseAuth
  xml_attribute :checksum
end
