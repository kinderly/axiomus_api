class AxiomusApi::RegionsPickupOrder < AxiomusApi::RegionsOrder

  def initialize
    super
    @address = AxiomusApi::RegionsPickupAddress
  end

end
