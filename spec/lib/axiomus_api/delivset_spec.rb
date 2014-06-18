require_relative '../../spec_helper'

describe AxiomusApi::Delivset do

  it 'should create below element' do
    delivset = build(:delivset)

    below = delivset.add_below_element
  end


end
