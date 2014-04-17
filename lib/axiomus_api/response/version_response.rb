require 'nokogiri'

class AxiomusApi::VersionResponse
  attr_accessor :version

  def initialize(xml)
    doc = Nokogiri::XML(xml)
    @version = doc.xpath('/response/version').text
  end
end

