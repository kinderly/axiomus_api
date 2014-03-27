require 'nokogiri'

class AxiomusApi::RegionsResponse
  class City
    attr_accessor :code
    attr_accessor :name

    def initialize(node)
      @code = node.xpath('@city_code').text.to_i
      @name = node.text
    end
  end

  class Office
    attr_accessor :code
    attr_accessor :city_code
    attr_accessor :name

    def initialize(node)
      @code = node.xpath('@office_code').text.to_i
      @city_code = node.xpath('@city_code').text.to_i
      @name = node.text
    end
  end

  class Region
    attr_accessor :code
    attr_accessor :name
    attr_accessor :courier
    attr_accessor :pickup

    def initialize(node)
      @code = node.xpath('@region_code').text
      @name = node.xpath('@name').text
      @courier = node.xpath('courier/city').map do |n|
        City.new(n)
      end

      @pickup = node.xpath('pickup/office').map do |n|
        Office.new(n)
      end
    end
  end

  attr_accessor :regions

  def initialize(xml)
    doc = Nokogiri::XML(xml)

    @regions = doc.xpath('response/region').map do |node|
      Region.new(node)
    end
  end
end
