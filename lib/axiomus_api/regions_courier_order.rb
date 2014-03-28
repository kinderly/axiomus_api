class AxiomusApi::RegionsCourierOrder < AxiomusApi::RegionsOrder

  def initialize
    super
    @address = AxiomusApi::RegionsCourierAddress
  end

end
