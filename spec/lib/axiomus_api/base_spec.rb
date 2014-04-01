require_relative '../../spec_helper'

describe 'AxiomusApi::Base' do

  it 'should raise on wrong xml options' do
    expect do
      class C < AxiomusApi::Base
        xml_field :some_field, unknown_option: 21
      end
    end.to raise_error
  end

  it 'should raise if no tag name' do

    class C < AxiomusApi::Base
      xml_field :value
    end

    c = C.new
    c.value = '32'

    expect{c.tag_name}.to raise_error

  end

end
