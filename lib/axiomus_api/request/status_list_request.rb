require_relative 'request'

class AxiomusApi::StatusListRequest < AxiomusApi::Request
  class Okey < ::AxiomusApi::Base
    xml_field :value, xml_type: :text
  end

  class Okeylist < ::AxiomusApi::Base
    xml_field_array :okey, type: Okey

    def add_okey(okey)
      n_okey = Okey.new
      n_okey.value = okey
      (@okey ||= []) << n_okey
    end
  end

  xml_field :okeylist

  def initialize
    @okeylist = Okeylist.new
  end

  def okeys=(value)
    okeys = value.is_a?(Array) ? value : [value]
    okeys.each do |o|
      @okeylist.add_okey(o.to_s)
    end
  end
end
