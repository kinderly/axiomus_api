require_relative 'base'

class AxiomusApi::Services < AxiomusApi::Base

  xml_attribute :cash, :cheque, :card, :big, optional: true

  def valid?
    (@cash ^ @cheque ^ @card) || (@cheque && @card)
  end
end
