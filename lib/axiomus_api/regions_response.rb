require 'nokogiri'

class AxiomusApi::RegionsResponse
  class City
    attr_accessor :code
    attr_accessor :name
  end

  class Office
    attr_accessor :code
    attr_accessor :city_code
    attr_accessor :name
  end

  class Region
    attr_accessor :code
    attr_accessor :name
    attr_accessor :courier
    attr_accessor :pickup
  end

  attr_accessor :regions

  def initialize(xml)
    @regions = []

    doc = Nokogiri::XML(xml)
    doc.xpath('response/region').each do |r_node|
      region = Region.new
      region.code = r_node.xpath('@region_code').text
      region.name = r_node.xpath('@name').text
      region.courier = []
      region.pickup = []

      r_node.xpath('courier/city').each do |c_node|
        city = City.new
        city.code = c_node.xpath("@city_code").text
        city.name = c_node.text
        region.courier << city
      end

      r_node.xpath('pickup/office').each do |o_node|
        office = Office.new
        office.code = o_node.xpath("@office_code").text
        office.city_code = o_node.xpath("@city_code").text
        office.name = o_node.text
        region.pickup << office
      end


      regions << region
    end
  end
end
