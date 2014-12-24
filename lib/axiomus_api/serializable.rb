#coding: utf-8
require 'nokogiri'

module AxiomusApi::Serializable
  def to_xml(xml_header = false, tag_name = nil)
    serializable_fields = self.class.attribute_meta
    attributes = extract_attributes(serializable_fields)

    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.send(tag_name || self.tag_name, attributes) {
        serializable_fields.each do |f, opt|
          next if opt[:xml_type] == :attribute
          xml_name = opt[:xml_name] || f
          xml_type = opt[:xml_type] || :element
          val = self.send(f)
          next if val.nil?
          elements = opt[:array] ? val : [val]

          elements.each do |el|
            create_by_type(xml, el, xml_type, xml_name)
          end
        end
      }
    end

    xml = xml_header ? builder.to_xml : builder.doc.root.to_xml
    normalize_axiomus_xml(xml)
  end

  private

  def extract_attributes(serializable_fields)
    attribute_fields = serializable_fields.select{|k,v| v[:xml_type] == :attribute}
    Hash[attribute_fields.map do |k,v|
      [v[:xml_name] || k, normalize_axiomus_xml(self.send(k).to_s)]
    end].reject{|k,v| v.nil? || v.empty?}
  end

  def create_by_type(xml, val, xml_type, xml_name)
    case xml_type
    when :element
      obj_to_xml(xml, val, xml_name)
    when :text
      xml.text(val)
    end
  end

  def obj_to_xml(xml, obj, xml_name = nil)
    if obj.kind_of?(AxiomusApi::Base)
      xml << obj.to_xml(false, xml_name)
    else
      xml.send(xml_name) {
        xml.text(normalize_axiomus_xml(obj.to_s))
      }
    end
  end

  def normalize_axiomus_xml(str)
    str.gsub(/&[^;]+;/, '').gsub('×','x')
  end

end
