require_relative '../../spec_helper'

describe AxiomusApi::Serializable do
  class Node < AxiomusApi::Base
    xml_element :node
    xml_field :value, xml_type: :text
    xml_attribute :id
  end


  it 'should serialize value as text node' do
    n = Node.new
    n.id = 1
    n.value = 'Some value'

    expect(n.to_xml()).to eq('<node id="1">Some value</node>')
  end

  it 'sanitizes output xml' do
    n = Node.new
    n.id = 1
    n.value = '12×13'

    expect(n.to_xml()).to eq('<node id="1">12x13</node>')
  end
end
