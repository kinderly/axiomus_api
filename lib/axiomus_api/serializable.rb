require('nokogiri')

module AxiomusApi::Serializable
  def to_xml(xml_header = false, tag_name = nil)
    serializable_fields = self.class.attribute_meta
    attribute_fields = serializable_fields.select{|k,v| v[:xml_type] == :attribute}

    attributes = Hash[attribute_fields.map do |k,v|
      [v[:xml_name] || k, self.send(k).to_s]
    end].reject{|k,v| v.nil? || v.empty?}

    builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
      xml.send(tag_name || self.tag_name, attributes) {
        serializable_fields.each do |f, opt|
          next if opt[:xml_type] == :attribute
          xml_name = opt[:xml_name] || f
          xml_type = opt[:xml_type] || :element
          val = self.send(f)

          next if val.nil?

          case xml_type
          when :element
            obj_to_xml(xml, val, xml_name)
          when :text
            xml.text(val)
          end
        end
      }
    end

    if xml_header
      builder.to_xml
    else
      builder.doc.root.to_xml
    end
  end

  def from_xml

  end

  private

  def obj_to_xml(xml, obj, xml_name = nil)
    if obj.respond_to?(:to_xml)
      xml << obj.to_xml(false, xml_name)
    elsif obj.kind_of?(Array)
      xml.send(xml_name) {
        obj.each{|el| obj_to_xml(xml, el)}
      }
    else
      xml.send(xml_name) {
        xml.text(obj.to_s)
      }
    end
  end

end
