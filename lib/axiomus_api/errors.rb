module AxiomusApi::Errors
  Error = Class.new(StandardError)

  class RequestError < Error
    attr_accessor :error_code

    def initialize(code)
      @error_code = code
    end
  end

  ValidationError = Class.new(Error)

end
