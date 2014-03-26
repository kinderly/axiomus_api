class AxiomusApi::BaseOrder
  attr_accessor :inner_id
  attr_accessor :name
  attr_accessor :from_mkad
  attr_accessor :places
  attr_accessor :city
  attr_accessor :sms
  attr_accessor :sms_sender
  attr_accessor :garden_ring
  attr_accessor :contacts
  attr_accessor :description
  attr_accessor :services
  attr_accessor :items
  attr_accessor :okey

  @optional_attributes = [
    :okey, :inner_id, :from_mkad, :sms, :sms_sender, :garden_ring, :description, :services
  ]
end
