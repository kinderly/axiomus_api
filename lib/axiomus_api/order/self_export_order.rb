require_relative 'base_order'

class AxiomusApi::SelfExportOrder < AxiomusApi::BaseOrder

  xml_attribute :car, :d_date, :b_time, :e_time, :quantity
  xml_field :services, optional: true

  def initialize
    super
    services = nil
  end

  def services=(val); end
end

