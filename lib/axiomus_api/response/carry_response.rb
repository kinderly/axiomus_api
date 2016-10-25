require 'nokogiri'

class AxiomusApi::CarryResponse

  attr_accessor :offices

  class Office
    attr_accessor :office_code
    attr_accessor :carry_type
    attr_accessor :office_name
    attr_accessor :office_address
    attr_accessor :city_code
    attr_accessor :city_name
    attr_accessor :gps
    attr_accessor :work_schedule
    attr_accessor :area
    attr_accessor :address

    def initialize(node)
      @office_code    = node.xpath('@office_code').text.to_i
      @carry_type     = node.xpath('@type').text
      @office_name    = node.xpath('@office_name').text
      @office_address = node.xpath('@office_address').text
      @city_code      = node.xpath('@city_code').text
      @city_name      = node.xpath('@city_name').text
      @gps            = node.xpath('@GPS').text
      @work_schedule  = node.xpath('@WorkSchedule').text
      @area           = node.xpath('@Area').text
      @address        = Address.new(node.xpath('address'))
      @services       = node.xpath('services').map(&:attributes).first
    end
  end

  class Address
    attr_accessor :country
    attr_accessor :city_code
    attr_accessor :name
    attr_accessor :region
    attr_accessor :locality
    attr_accessor :district
    attr_accessor :street
    attr_accessor :house
    attr_accessor :building
    attr_accessor :apartment
    attr_accessor :zip_code

    def initialize(node)
      @country     = node.xpath('country').text
      @city_code   = node.xpath('city_code').text
      @name        = node.xpath('name').text
      @region      = node.xpath('region').text
      @locality    = node.xpath('locality').text
      @district    = node.xpath('distict').text
      @street      = node.xpath('street').text
      @house       = node.xpath('house').text
      @building    = node.xpath('building').text
      @appartment  = node.xpath('appartment').text
      @zip_code    = node.xpath('zipCode').text
    end
  end


  def initialize(xml)
    doc = Nokogiri::XML(xml)
    @offices = doc.xpath('response/carry_list/office').map do |node|
      Office.new(node)
    end
  end
end
