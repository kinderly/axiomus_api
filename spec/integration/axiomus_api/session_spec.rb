require_relative '../../spec_helper'

describe 'AxiomusApi::Sesion' do
  before(:all) do
    AxiomusApi.logger.level = Logger::INFO
    @session = AxiomusApi.test_session
  end

  describe '.get_regions' do
    it 'should handle successfull request' do
      z = @session.get_regions()
      expect(z.regions.count > 0).to be_true

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
