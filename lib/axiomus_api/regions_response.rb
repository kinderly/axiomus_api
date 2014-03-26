class AxiomusApi::RegionsResponse
  class City
    attr_accessor :code
    attr_accessor :name
  end

  class Office
    attr_accessor :code
    attr_accessor :city_code
    attr_accessor :name
  end

  attr_accessor :code
  attr_accessor :name
  attr_accessor :courier
  attr_accessor :pickup
end
