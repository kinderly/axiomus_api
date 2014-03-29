require_relative '../../spec_helper'

describe 'AxiomusApi::Session' do
  before(:all) do
    AxiomusApi.logger.level = Logger::UNKNOWN

    @session = AxiomusApi.test_session
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
    describe ".#{method}" do
      it 'should handle successful request' do
        HttpMocking.enqueue_response(DummyData.order_success_response(method))
        response = @session.send(method, DummyData.basic_order)
        expect(response.code).to eq 0
      end

      it 'should raise on error' do
        HttpMocking.enqueue_response(DummyData.order_error_response(method))
        expect{@session.send(method, DummyData.basic_order)}.to raise_error(AxiomusApi::Errors::RequestError)
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

  describe '.status' do
    it 'should handle successfull request' do
      HttpMocking.enqueue_response(DummyData::STATUS_SUCCESS_RESPONSE)
      z = @session.status('2e3023c3e78f4f0c8cbb81257743c2d7')
      expect(z.order.id).to eq('1013')
      expect(z.order.inner_id).to eq('16777')
      expect(z.order.price).to eq(156.83)
      expect(z.status.code).to eq(211)
      expect(z.refused_items.count).to eq(1)
      expect(z.packs.count).to eq(1)
    end
  end

end
