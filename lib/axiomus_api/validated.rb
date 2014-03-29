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
      if !(options[:type].nil? || value.is_a?(options[:type]))
        @validation_errors << "Field #{field} must be of type #{options[:type]}"
      elsif value.respond_to?(:valid?) && !value.valid?
        @validation_errors += value.validation_errors.map{|ve| "#{field} -> #{ve}"}
      end
    end
  end

end
