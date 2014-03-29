module AxiomusApi::Validated
  attr_reader :validation_errors

  def validate!
    @validation_errors = []
    return true unless kind_of? ::AxiomusApi::Base

    self.class.attribute_meta.each do |k, v|

      if !v[:optional]
        val = self.send(k)

        if val.nil? || (val.respond_to?(:empty?) && val.empty?)
          @validation_errors << "field #{k} is reqired"
        elsif !(v[:type].nil? || val.is_a?(v[:type]))
          @validation_errors << "field #{k} must be of type #{v[:type]}"
        elsif val.respond_to?(:validate!) && !val.validate!
          @validation_errors += val.validation_errors.map{|ve| "#{k} -> #{ve}"}
        end
      end
    end

    return !@validation_errors.any?
  end
end
