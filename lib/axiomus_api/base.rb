require_relative('serializable')

class AxiomusApi::Base
  include AxiomusApi::Serializable

  def self.xml_element(element_name)
    @xml_element = element_name
  end

  def self.xml_field(attr_name, hash = {})
    hash.keys.each do |k|
      raise "Wrong attribute #{k}" if ![:xml_type, :xml_name, :optional].include?(k)
    end

    @attr_info ||= {}
    @attr_info[attr_name] = hash
    attr_accessor attr_name
  end

  def self.attribute_meta
    res = superclass.respond_to?(:attribute_meta) ? superclass.attribute_meta  : {}
    res.merge(@attr_info || {})
  end

  def self.attribute_names
    attribute_meta.keys?
  end

  def self.tag_name
    if @xml_element.nil?
      if superclass.respond_to?(:tag_name)
        superclass.tag_name
      else
        raise 'xml_element not specified'
      end
    else
      @xml_element
    end
  end

  def tag_name
    self.class.tag_name
  end

  def attributes
    res = self.class.attribute_meta.clone

    res.each do |k|
      res[k] = self.send(k)
    end
  end

end
