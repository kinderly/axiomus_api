module AxiomusApi::Errors
  Error = Class.new(StandardError)

  class OrderRequestError < Error
    attr_accessor :error_code

    def initialize(code)
      @error_code = code
    end
  end
end
