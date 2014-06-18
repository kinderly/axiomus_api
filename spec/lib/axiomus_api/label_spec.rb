require_relative '../../spec_helper'

describe AxiomusApi::Label do
  it 'should generate barcode' do
    @label = build(:label)
    expect{barcode = @label_barcode64}.not_to raise_error
  end

  it 'should render single label' do
    @label = build(:label)
    expect{html = described_class.render(@label)}.not_to raise_error
  end

  it 'should render multiple labels' do
    @labels = (1..10).map{build(:label)}
    expect{html = described_class.render(@labels)}.not_to raise_error
  end

  it 'renders label without places' do
    @label = build(:label_without_places)
    expect{html = described_class.render(@label)}.not_to raise_error
  end

end
