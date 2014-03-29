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
