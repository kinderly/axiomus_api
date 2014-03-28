require_relative 'base'

class AxiomusApi::BaseOrder < AxiomusApi::Base
  xml_element :order

  xml_field :inner_id, xml_type: :attribute, optional: true
  xml_field :name, xml_type: :attribute
  xml_field :from_mkad, xml_type: :attribute, optional: true
  xml_field :places, xml_type: :attribute
  xml_field :city, xml_type: :attribute
  xml_field :sms, optional: true, xml_type: :attribute
  xml_field :sms_sender, optional: true, xml_type: :attribute
  xml_field :garden_ring, optional: true, xml_type: :attribute
  xml_field :contacts
  xml_field :description, optional: true
  xml_field :services, optional: true
  xml_field :items
  xml_field :okey, optional: true, xml_type: :attribute

  def initialize
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
      new_ems: AxiomusApi::EmsOrder,
      update_ems: AxiomusApi::EmsOrder,
      new_region_courier: AxiomusApi::RegionsCourierOrder,
      update_region_courier: AxiomusApi::RegionsCourierOrder,
      new_region_pickup: AxiomusApi::RegionsPickupOrder,
      update_region_pickup: AxiomusApi::RegionsPickupOrder
    }[mode].new
  end

  ORDER_MODES = [:new, :update, :new_carry, :update_carry, :new_export, :update_export,
    :new_self_export, :update_self_export, :new_post, :update_post, :new_ems, :update_ems,
    :new_region_courier, :update_region_courier, :new_region_pickup, :update_region_pickup]
end
