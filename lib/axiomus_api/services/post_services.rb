require_relative '../base'

class AxiomusApi::PostServices < AxiomusApi::Base

  xml_attribute :valuation, :fragile, :cod, :big, :class1, :post_tarif, :not_avia, :optimize, optional: true

end
