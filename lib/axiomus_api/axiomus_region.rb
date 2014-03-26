class AxiomusApi::AxiomusRegion
  class City
    attr_reader :code
    attr_reader :name
  end

  class Office
    attr_reader :code
    attr_reader :city_code
    attr_reader :name
  end

  attr_reader :code
  attr_reader :name
  attr_reader :courier
  attr_reader :pickup
end
