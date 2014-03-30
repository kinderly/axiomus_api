require_relative '../base'
require_relative '../services/services'

class AxiomusApi::BaseOrder < AxiomusApi::Base
  xml_element :order

  xml_field :contacts, :items
  xml_field :description
  xml_attribute :inner_id, :okey, optional: true
  xml_attribute :name, :places
  xml_field :services, type: AxiomusApi::Services

  def initialize
    super
    @items = []
  end

  def total_quantity
    @items.inject(0){|sum, it| sum + it.quantity}
  end

  def checksum(uid)
    Digest::MD5.hexdigest("#{uid}u#{@items.count}#{total_quantity}")
  end

  def create_item
    AxiomusApi::Item.new
  end

  def self.create_by_mode(mode)
    {
      new: AxiomusApi::DeliveryOrder,
      update: AxiomusApi::DeliveryOrder,
      new_carry: AxiomusApi::PickupOrder,
      update_carry: AxiomusApi::PickupOrder,
      new_export: AxiomusApi::ExportOrder,
      update_export: AxiomusApi::ExportOrder,
      new_self_export: AxiomusApi::SelfExportOrder,
      update_self_export: AxiomusApi::SelfExportOrder,
      new_post: AxiomusApi::PostOrder,
      update_post: AxiomusApi::PostOrder,
      new_dpd: AxiomusApi::DpdOrder,
      update_dpd: AxiomusApi::DpdOrder,
      new_ems: AxiomusApi::EmsOrder,
      update_ems: AxiomusApi::EmsOrder,
      new_region_courier: AxiomusApi::RegionsCourierOrder,
      update_region_courier: AxiomusApi::RegionsCourierOrder,
      new_region_pickup: AxiomusApi::RegionsPickupOrder,
      update_region_pickup: AxiomusApi::RegionsPickupOrder
    }[mode].new
  end

end
