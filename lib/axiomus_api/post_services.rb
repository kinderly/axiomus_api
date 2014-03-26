class AxiomusApi::PostServices
  attr_accessor :valuation
  attr_accessor :fragile
  attr_accessor :cod
  attr_accessor :big

  optional_attributes = [:valuation, :fragile, :cod, :big]
end
