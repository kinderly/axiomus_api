require_relative '../base'
require_relative '../services/services'
require_relative '../items/items'

class AxiomusApi::BaseOrder < AxiomusApi::Base
  xml_element :order

  xml_field :contacts
  xml_field :items, type: AxiomusApi::Items
  xml_field :description, optional: true
  xml_attribute :inner_id, :okey, :avoid_part_return, optional: true
  xml_attribute :name, :places
  xml_field :services, type: AxiomusApi::Services

  def total_quantity
    @items.item.inject(0){|sum, it| sum + it.quantity}
  end

  def checksum(uid)
    Digest::MD5.hexdigest("#{uid}u#{@items.item.count}#{total_quantity}")
  end

  def self.create_by_mode(mode)
    {
      new: AxiomusApi::Order,
      update: AxiomusApi::Order,
      new_carry: AxiomusApi::CarryOrder,
      update_carry: AxiomusApi::CarryOrder,
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
      new_region_courier: AxiomusApi::RegionCourierOrder,
      update_region_courier: AxiomusApi::RegionCourierOrder,
      new_region_pickup: AxiomusApi::RegionPickupOrder,
      update_region_pickup: AxiomusApi::RegionPickupOrder
    }[mode].new
  end

end
