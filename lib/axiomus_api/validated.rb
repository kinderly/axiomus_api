module AxiomusApi::Validated
  attr_reader :validation_errors

  def valid?
    @validation_errors = []
    return true unless kind_of? ::AxiomusApi::Base

    self.class.attribute_meta.each do |k, v|
      val = self.send(k)
      validate_field(k, val, v)
    end

    return !@validation_errors.any?
  end

  private

  def validate_field(field, value, options)
    if value.nil? || (value.respond_to?(:empty?) && value.empty?)
      if !options[:optional]
        @validation_errors << "Field #{field} is required"
      end
    else
      if options[:array]
        validate_array_field(field, value, options)
      else
        validate_present_field(field, value, options)
      end
    end
  end

  def validate_array_field(field, value, options)
    if value.is_a?(Array)
      if !options[:max_occurs].nil? && (value.count > options[:max_occurs])
        @validation_errors << "Field #{field} can have #{options[:max_occurs]} elements maximum"
      end

      value.each do |el, i|
        validate_present_field("#{field}[#{i}]", el, options)
      end
    else
      @validation_errors << "Element #{field} must be an array"
    end
  end

  def validate_present_field(field, value, options)
    if !(options[:type].nil? || value.is_a?(options[:type]))
      @validation_errors << "Field #{field} must be of type #{options[:type]}"
    elsif value.respond_to?(:valid?) && !value.valid?
      @validation_errors += value.validation_errors.map{|ve| "#{field} -> #{ve}"}
    end
  end

end
