require 'nokogiri'

class AxiomusApi::OrderResponse
  attr_accessor :okey
  attr_accessor :object_id
  attr_accessor :code
  attr_accessor :description
  attr_accessor :price
  attr_accessor :request

  def initialize(xml)
    doc = Nokogiri::XML(xml)
    @request = doc.xpath('response/request').text
    @okey = doc.xpath('response/auth').text
    @object_id = doc.xpath('response/auth/@objectid').text
    @code = doc.xpath('response/status/@code').text.to_i
    @description = doc.xpath('response/status').text
    @price = doc.xpath('response/status/@price').text
  end

  def error_message
    @description unless success?
  end

  def success?
    @code == AxiomusApi::ResponseCodes::SUCCESS
  end
end

