require_relative '../spec_helper'

describe 'AxiomusApi::Session' do
  before(:all) do
    @session = AxiomusApi::Session.new(92, 'XXcd208495d565ef66e7dff9f98764XX', true)
  end

  [
    :new,
    :update,
    :new_carry,
    :update_carry,
    :new_export,
    :update_export,
    :new_self_export,
    :update_self_export,
    :new_post,
    :update_post,
    :new_ems,
    :update_ems,
    :new_region_courier,
    :update_region_courier,
    :new_region_pickup,
    :update_region_pickup
  ].each do |method|
    describe :method do
      it 'should handle successful request' do
        HttpMocking.enqueue_response(DummyData.order_success_response(method))
        response = @session.send(method, AxiomusApi::BaseOrder.new)
        expect(response.code).to eq 0
      end

      it 'should raise on error' do
        HttpMocking.enqueue_response(DummyData.order_error_response(method))
        expect{@session.send(method, AxiomusApi::BaseOrder.new)}.to raise_error(AxiomusApi::Errors::OrderRequestError)
      end
    end
  end

  describe '.get_regions' do
    it 'should handle successfull request' do
      HttpMocking.enqueue_response(DummyData::REGIONS_SUCCESS_RESPONSE)
      z = @session.get_regions()
      expect(z.regions.count).to eq 1
      expect(z.regions.first.code).to eq '21'
    end
  end

end
