require_relative '../../spec_helper'

describe 'AxiomusApi::Sesion' do
  before(:all) do
    AxiomusApi.logger.level = Logger::INFO
    @session = AxiomusApi.test_session
  end

  describe '#get_regions' do
    it 'should handle successfull request' do
      z = @session.get_regions()
      expect(z.regions.count > 0).to be_true
    end
  end

  describe '#status' do
    it 'should handle successfull request' do
      z = @session.status('2e3023c3e78f4f0c8cbb81257743c2d7')
    end
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
    describe "##{method}" do
      it 'should handle successful request' do
        response = @session.send(method, build(:base_order))
        expect(response.code).to eq 0
      end
    end
  end
end
