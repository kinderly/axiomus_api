require_relative('serializable')
require_relative('validated')

class AxiomusApi::Base
  include AxiomusApi::Serializable
  include AxiomusApi::Validated

  def self.xml_element(element_name)
    @xml_element = element_name
  end

  def self.xml_field(*args)
    options = extract_options(args)

    options.keys.each do |k|
      raise "Wrong attribute #{k}" if ![:xml_type, :xml_name, :optional, :type].include?(k)
    end

    args.each do |attr_name|
      @attr_info ||= {}
      @attr_info[attr_name] = options
      attr_accessor attr_name
    end
  end

  def self.xml_attribute(*args)
    options = extract_options(args)
    args << options.merge({xml_type: :attribute})
    xml_field(*args)
  end

  def self.attribute_meta
    res = superclass.respond_to?(:attribute_meta) ? superclass.attribute_meta  : {}
    res.merge(@attr_info || {})
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

  def self.extract_options(args)
    if args.last.is_a?(Hash) && args.last.instance_of?(Hash)
      args.pop
    else
      {}
    end
  end

  def initialize
    self.class.attribute_meta.each do |k, v|
      if v[:type]
        self.send("#{k}=".to_sym, v[:type].new)
      end
    end
  end

end
