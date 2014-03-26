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
end
