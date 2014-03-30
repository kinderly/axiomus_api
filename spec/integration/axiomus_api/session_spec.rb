require_relative '../../spec_helper'

describe 'AxiomusApi::Sesion' do
  before(:all) do
    AxiomusApi.logger.level = Logger::DEBUG
    @session = AxiomusApi.test_session
  end

  describe '#get_regions' do
    it 'should handle successfull request' do
      z = @session.get_regions()
      expect(z.regions.count > 0).to be_true
    end
  end

  describe '#new, #update' do
    it 'should create new order and update it' do
      delivery_order = build(:delivery_order)
      z = @session.new(delivery_order)

      delivery_order.okey = z.okey
      @session.update(delivery_order)
    end
  end

  describe '#new_carry, #update_carry' do
    it 'should create new order and update it' do
      pickup_order = build(:pickup_order)
      z = @session.new_carry(pickup_order)

      pickup_order.okey = z.okey
      @session.update_carry(pickup_order)
    end
  end

  describe '#new_export, #update_export' do
    it 'should create new order and update it' do
      export_order = build(:export_order)
      z = @session.new_export(export_order)

      export_order.okey = z.okey
      @session.update_export(export_order)
    end
  end

  describe '#new_self_export, #update_self_export' do
    it 'should create new order and update it' do
      self_export_order = build(:self_export_order)
      z = @session.new_self_export(self_export_order)

      self_export_order.okey = z.okey
      @session.update_self_export(self_export_order)
    end
  end

  describe '#new_post, #update_post' do
    it 'should create new order and update it' do
      post_order = build(:post_order)
      z = @session.new_post(post_order)

      post_order.okey = z.okey
      @session.update_post(post_order)
    end
  end


end
