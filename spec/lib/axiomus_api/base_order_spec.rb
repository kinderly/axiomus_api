require_relative '../../spec_helper'

describe 'AxiomusApi::BaseOrder' do
  it 'should build order by mode' do
    AxiomusApi::BaseOrder::ORDER_MODES.each do |mode|
      order = AxiomusApi::BaseOrder.create_by_mode(mode)
    end
  end

  it 'should create item' do
    AxiomusApi::BaseOrder::ORDER_MODES.each do |mode|
      order = AxiomusApi::BaseOrder.create_by_mode(mode)
      item = order.create_item

      if [:new_export, :update_export].include?(mode)
        expect(item.is_a?(AxiomusApi::ExportItem)).to be_true
      else
        expect(item.is_a?(AxiomusApi::Item)).to be_true
      end
    end
  end

end

{
  AxiomusApi::EmsOrder => AxiomusApi::EmsAddress,
  AxiomusApi::PostOrder => AxiomusApi::PostAddress,
  AxiomusApi::RegionsCourierOrder => AxiomusApi::RegionsCourierAddress,
  AxiomusApi::RegionsPickupOrder => AxiomusApi::RegionsPickupAddress
}.each do |c, a|
  describe c.name do
    it 'should have correct address type' do
      expect(c.new.address).to be_an a
    end
  end
end

{
  AxiomusApi::DeliveryOrder => AxiomusApi::Services,
  AxiomusApi::EmsOrder => AxiomusApi::PostServices,
  AxiomusApi::ExportOrder => AxiomusApi::ExportServices,
  AxiomusApi::PickupOrder => AxiomusApi::Services,
  AxiomusApi::PostOrder => AxiomusApi::PostServices,
  AxiomusApi::RegionsCourierOrder => AxiomusApi::RegionsServices,
  AxiomusApi::RegionsPickupOrder => AxiomusApi::RegionsServices
}.each do |c, a|
  describe c.name do
    it 'should have correct services type' do
      expect(c.new.services).to be_an a
    end
  end
end
