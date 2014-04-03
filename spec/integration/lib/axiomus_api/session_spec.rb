require_relative '../../../spec_helper'

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

  describe '#new, #update' do
    it 'should create new order and update it' do
      order = build(:order)
      z = @session.new(order)
      expect(z.code).to eq 0
      okey = z.okey
      order.okey = okey
      z = @session.update(order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end

    it 'should support #delivset field' do
      order = build(:order, :with_delivset)
      z = @session.new(order)
      expect(z.code).to eq 0
      okey = z.okey
      order.okey = okey
      z = @session.update(order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end
  end

  describe '#new_carry, #update_carry' do
    it 'should create new order and update it' do
      carry_order = build(:carry_order)
      z = @session.new_carry(carry_order)
      expect(z.code).to eq 0
      okey = z.okey
      carry_order.okey = okey
      z = @session.update_carry(carry_order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end

    it 'should support #delivset field' do
      carry_order = build(:carry_order, :with_delivset)
      z = @session.new_carry(carry_order)
      expect(z.code).to eq 0
      okey = z.okey
      carry_order.okey = okey
      z = @session.update_carry(carry_order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end
  end

  describe '#new_export, #update_export' do
    it 'should create new order and update it' do
      export_order = build(:export_order)
      z = @session.new_export(export_order)
      expect(z.code).to eq 0
      okey = z.okey
      export_order.okey = okey
      z = @session.update_export(export_order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end
  end

  describe '#new_self_export, #update_self_export' do
    it 'should create new order and update it' do
      self_export_order = build(:self_export_order)
      z = @session.new_self_export(self_export_order)
      expect(z.code).to eq 0
      okey = z.okey
      self_export_order.okey = okey
      z = @session.update_self_export(self_export_order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end
  end

  describe '#new_post, #update_post' do
    it 'should create new order and update it' do
      post_order = build(:post_order)
      z = @session.new_post(post_order)
      expect(z.code).to eq 0
      okey = z.okey
      post_order.okey = okey
      z = @session.update_post(post_order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end
  end

  describe '#new_dpd, #update_dpd' do
    it 'should create new order and update it' do
      dpd_order = build(:dpd_order)
      z = @session.new_dpd(dpd_order)
      expect(z.code).to eq 0
      okey = z.okey
      dpd_order.okey = okey
      z = @session.update_dpd(dpd_order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end
  end

  describe '#new_ems, #update_ems' do
    it 'should create new order and update it' do
      ems_order = build(:ems_order)
      z = @session.new_ems(ems_order)
      expect(z.code).to eq 0
      okey = z.okey
      ems_order.okey = okey
      z = @session.update_ems(ems_order)
      expect(z.code).to eq 0
      z = @session.status(okey)
    end
  end

  describe '#new_region_courier, #update_region_courier' do
    it 'should create new order and update it' do
      region_courier_order = build(:region_courier_order)
      z = @session.new_region_courier(region_courier_order)
      expect(z.code).to eq 0
      okey = z.okey
      region_courier_order.okey = okey
      expect{@session.update_region_courier(region_courier_order)}.to raise_error ::AxiomusApi::Errors::RequestError

    end
  end

  describe '#new_region_pickup, #update_region_pickup' do
    it 'should create new order and update it' do
      region_pickup_order = build(:region_pickup_order)
      z = @session.new_region_pickup(region_pickup_order)
      expect(z.code).to eq 0
      okey = z.okey
      region_pickup_order.okey = okey
      expect{@session.update_region_pickup(region_pickup_order)}.to raise_error ::AxiomusApi::Errors::RequestError
    end
  end

end
