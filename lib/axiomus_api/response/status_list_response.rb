require 'nokogiri'

class AxiomusApi::StatusListResponse
  class Okey
    attr_accessor :id
    attr_accessor :status_code
    attr_accessor :status_name
    attr_accessor :inner_id
    attr_accessor :price
    attr_accessor :customer_price
    attr_accessor :value

    def initialize(xml_node)
      @id = xml_node.xpath('@id').text
      @status_code = xml_node.xpath('@status_code').text
      @status_name = xml_node.xpath('@status_name').text
      @inner_id = xml_node.xpath('@inner_id').text
      @price = xml_node.xpath('@price').text.to_f
      @customer_price = xml_node.xpath('@customer_price').text.to_f
      @value = xml_node.text
    end
  end

  attr_accessor :okeys

  def initialize(xml)
    doc = Nokogiri::XML(xml)
    @okeys = doc.xpath('/response/okeylist/okey').map do |node|
      Okey.new(node)
    end
  end
end

