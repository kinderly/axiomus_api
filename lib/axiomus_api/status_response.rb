require 'nokogiri'

class AxiomusApi::StatusResponse
  class Order
    attr_accessor :id
    attr_accessor :inner_id
    attr_accessor :price

    def initialize(node)
      @id = node.xpath('@id').text
      @inner_id = node.xpath('@inner_id').text
      @price = node.xpath('@price').text.to_f
    end
  end

  class Status
    attr_accessor :code
    attr_accessor :description

    def initialize(node)
      @code = node.xpath('@code').text.to_i
      @description = node.text
    end
  end

  class PostStatus
    attr_accessor :tracking
    attr_accessor :postprice

    def initialize(node)
      @tracking = node.xpath('@tracking').text
      @postprice = node.xpath('@postprice').text.to_f
    end
  end

  class Pack
    attr_accessor :number
    attr_accessor :places
    attr_accessor :status

    def initialize(node)
      @number = node.xpath('@number').text
      @places = node.xpath('@places').text.to_i
      @status = node.xpath('@status').text.to_i
    end
  end

  class Item
    attr_accessor :name
    attr_accessor :quantity
    attr_accessor :price

    def initialize(node)
      @name = node.xpath('@name').text
      @quantity = node.xpath('@quantity').text.to_i
      @price = node.xpath('@price').text.to_f
    end
  end

  attr_accessor :d_date
  attr_accessor :refused_items
  attr_accessor :poststatus
  attr_accessor :packs
  attr_accessor :order
  attr_accessor :status

  def initialize(xml)
    doc = Nokogiri::XML(xml)

    xml_date = doc.xpath('response/d_date')
    @d_date = Date.parse(xml_date.text) unless xml_date.empty?
    @order = Order.new(doc.xpath('response/order'))
    @refused_items = doc.xpath('response/refused_items/item').map do |node|
      Item.new(node)
    end
    @poststatus = PostStatus.new(doc.xpath('response/poststatus'))
    @packs = doc.xpath('response/packs/pack').map do |node|
      Pack.new(node)
    end
    @status = Status.new(doc.xpath('response/status'))
  end
end

