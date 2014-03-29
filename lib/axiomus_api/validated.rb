module AxiomusApi::Validated
  attr_reader :validation_errors

  def valid?
    @validation_errors = []
    return true unless kind_of? ::AxiomusApi::Base

    self.class.attribute_meta.each do |k, v|
      val = self.send(k)

      if val.nil? || (val.respond_to?(:empty?) && val.empty?)
        if !v[:optional]
          @validation_errors << "field #{k} is reqired"
        end
      else
        if !(v[:type].nil? || val.is_a?(v[:type]))
          @validation_errors << "field #{k} must be of type #{v[:type]}"
        elsif val.respond_to?(:valid?) && !val.valid?
          @validation_errors += val.validation_errors.map{|ve| "#{k} -> #{ve}"}
        end
      end
    end

    return !@validation_errors.any?
  end
end
