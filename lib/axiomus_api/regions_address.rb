class AxiomusApi::RegionsAddress
  attr_accessor :region_code
  attr_accessor :city_code
  attr_accessor :index
  attr_accessor :street
  attr_accessor :house
  attr_accessor :building
  attr_accessor :apartment

  @optional_attributes = [:building, :apartment]
end
