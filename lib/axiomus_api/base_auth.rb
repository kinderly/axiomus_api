require_relative 'base'

class AxiomusApi::BaseAuth < AxiomusApi::Base
  xml_field :ukey, xml_type: :attribute
end

class AxiomusApi::Auth < AxiomusApi::BaseAuth
  xml_field :checksum, xml_type: :attribute
end
