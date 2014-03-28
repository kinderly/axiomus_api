require_relative '../spec_helper'

describe 'AxiomusApi::BaseOrder' do
  it 'should build order by mode' do
    AxiomusApi::BaseOrder::ORDER_MODES.each do |mode|
      order = AxiomusApi::BaseOrder.create_by_mode(mode)
    end
  end
end
