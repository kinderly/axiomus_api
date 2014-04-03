require_relative '../../../spec_helper'

describe 'AxiomusApi::BaseOrder' do

  it 'should build order by mode' do
    ORDER_MODES.each do |mode|
      order = AxiomusApi::BaseOrder.create_by_mode(mode)
    end
  end

  it 'should create item' do
    ORDER_MODES.each do |mode|
      order = AxiomusApi::BaseOrder.create_by_mode(mode)
      item = order.items.add_item
      item.quantity = 21
      expect(order.items.item.first.quantity).to eq(21)

      if [:new_export, :update_export, :new_self_export, :update_self_export].include?(mode)
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
  AxiomusApi::RegionCourierOrder => AxiomusApi::RegionCourierAddress,
  AxiomusApi::RegionPickupOrder => AxiomusApi::RegionPickupAddress,
  AxiomusApi::DpdOrder => AxiomusApi::DpdAddress
}.each do |c, a|
  describe c.name do
    it 'should have correct address type' do
      expect(c.new.address).to be_an a
    end
  end
end

{
  AxiomusApi::Order => AxiomusApi::Services,
  AxiomusApi::EmsOrder => AxiomusApi::PostServices,
  AxiomusApi::ExportOrder => AxiomusApi::ExportServices,
  AxiomusApi::CarryOrder => AxiomusApi::Services,
  AxiomusApi::PostOrder => AxiomusApi::PostServices,
  AxiomusApi::RegionCourierOrder => AxiomusApi::RegionServices,
  AxiomusApi::RegionPickupOrder => AxiomusApi::RegionServices,
  AxiomusApi::DpdOrder => AxiomusApi::PostServices
}.each do |c, a|
  describe c.name do
    it 'should have correct services type' do
      expect(c.new.services).to be_an a
    end
  end
end
