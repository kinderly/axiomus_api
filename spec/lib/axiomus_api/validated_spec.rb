require_relative '../../spec_helper'

describe 'AxiomusApi::Validated' do

  it 'should validate required fields' do
    address = build(:dpd_address, :without_region)
    expect(address).not_to be_valid
    expect(address.validation_errors).to have(1).items
  end

  it 'should validate empty fields' do
    order = build(:order, :with_empty_address)
    expect(order).not_to be_valid
    expect(order.validation_errors).to have(1).items
  end

  it 'should validate wrong type fields' do
    order = build(:post_order, :with_region_services)
    expect(order).not_to be_valid
    expect(order.validation_errors).to have(1).items
  end

  it 'should validate nested fields' do
    order = build(:dpd_order)
    order.address.region = nil
    expect(order).not_to be_valid
    expect(order.validation_errors).to have(1).items
  end

  it 'should validate correct items' do
    order = build(:post_order)
    expect(order).to be_valid
    expect(order.validation_errors).to have(0).items
  end

end
