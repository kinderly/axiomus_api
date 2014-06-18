require_relative '../../spec_helper'

describe AxiomusApi::Validated do

  it 'should validate required fields' do
    address = build(:dpd_address, :without_region)
    expect(address).not_to be_valid
    expect(address.validation_errors).to have_exactly(1).items
  end

  it 'should validate empty fields' do
    order = build(:order, :with_empty_address)
    expect(order).not_to be_valid
    expect(order.validation_errors).to have_exactly(1).items
  end

  it 'should validate wrong type fields' do
    order = build(:post_order, :with_region_services)
    expect(order).not_to be_valid
    expect(order.validation_errors).to have_exactly(1).items
  end

  it 'should validate nested fields' do
    order = build(:dpd_order)
    order.address.region = nil
    expect(order).not_to be_valid
    expect(order.validation_errors).to have_exactly(1).items
  end

  it 'should validate correct items' do
    order = build(:post_order)
    expect(order).to be_valid
    expect(order.validation_errors).to have_exactly(0).items
  end

  it 'should validate array items' do
    order = build(:order)
    order.delivset = AxiomusApi::Delivset.new
    order.delivset.below = 'Some arbitrary string'
    order.delivset.return_price = 12
    order.delivset.above_sum = 12
    order.delivset.above_price = 12
    expect(order).not_to be_valid
    expect(order.validation_errors).to have_exactly(1).items
  end

  it 'should validate max occurs' do
    order = build(:order)
    order.delivset = AxiomusApi::Delivset.new
    order.delivset.return_price = 12
    order.delivset.above_sum = 12
    order.delivset.above_price = 12

    4.times do
      order.delivset.below << build(:below)
    end

    expect(order).not_to be_valid
    expect(order.validation_errors).to have_exactly(1).items
  end

  it 'should validate optional arrays' do
    order = build(:order)
    order.delivset = AxiomusApi::Delivset.new
    order.delivset.return_price = 12
    order.delivset.above_sum = 12
    order.delivset.above_price = 12
    order.delivset.below = []
    expect(order).to be_valid
  end

end
