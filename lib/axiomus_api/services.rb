require_relative 'base'

class AxiomusApi::Services < AxiomusApi::Base
  xml_field :cash, xml_type: :attribute, optional: true
  xml_field :cheque, xml_type: :attribute, optional: true
  xml_field :card, xml_type: :attribute, optional: true
  xml_field :big, xml_type: :attribute, optional: true

  def valid?
    (@cash ^ @cheque ^ @card) || (@cheque && @card)
  end
end
