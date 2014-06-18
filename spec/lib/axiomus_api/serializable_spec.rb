require_relative '../../spec_helper'

describe AxiomusApi::Serializable do

  it 'should serialize value as text node' do

    class Node < AxiomusApi::Base
      xml_element :node
      xml_field :value, xml_type: :text
      xml_attribute :id
    end

    n = Node.new
    n.id = 1
    n.value = 'Some value'

    expect(n.to_xml()).to eq('<node id="1">Some value</node>')

  end


end
