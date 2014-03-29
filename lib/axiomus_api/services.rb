require_relative 'base'

class AxiomusApi::Services < AxiomusApi::Base

  xml_attribute :cash, :cheque, :card, :big, optional: true

  def validate!
    super && (@cash ^ @cheque ^ @card) || (@cheque && @card)
  end
end
