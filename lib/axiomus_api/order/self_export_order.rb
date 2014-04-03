require_relative 'base_order'
require_relative '../items/export_items'

class AxiomusApi::SelfExportOrder < AxiomusApi::BaseOrder

  xml_attribute :car, :d_date, :b_time, :e_time, :quantity
  xml_field :services, optional: true
  xml_field :items, type: AxiomusApi::ExportItems

  def initialize
    super
    @services = nil
  end

  def services=(val); end

end

