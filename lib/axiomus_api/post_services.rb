require_relative 'base'

class AxiomusApi::PostServices < AxiomusApi::Base
  xml_field :valuation, xml_type: :attribute, optional: true
  xml_field :fragile, xml_type: :attribute, optional: true
  xml_field :cod, xml_type: :attribute, optional: true
  xml_field :big, xml_type: :attribute, optional: true
end
