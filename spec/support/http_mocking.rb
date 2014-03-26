require 'net/http'

module HttpMocking

  def self.clear_response_queue
    @responses = []
  end

  def self.enqueue_response(response_body, code = '200', msg='OK')
    @responses ||= []
    @responses.push([response_body, code, msg])

    Net::HTTP.any_instance.stub(:request) do |req|
      next_response = @responses.shift
      response = Net::HTTPResponse.new(1.0, next_response[1], next_response[2])
      response.stub(:body => next_response[0])
      response
    end
  end

end
