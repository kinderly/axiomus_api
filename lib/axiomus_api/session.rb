require 'net/http'
require_relative 'actions'
require_relative 'response/regions_response'
require_relative 'response/status_response'
require_relative 'response/status_list_response'
require_relative 'response/version_response'
require_relative 'response/order_response'

class AxiomusApi::Session
  include AxiomusApi::Actions

  attr_reader :test

  def initialize(uid, ukey, test = true)
    @test = test
    @uid = uid
    @ukey = ukey

    if(block_given?)
      yield self
    end
  end

  ['', '_carry', '_export', '_self_export', '_post', '_dpd',
   '_ems', '_region_courier', '_region_pickup'].each do |suffix|
    [:new, :update].each do |prefix|
      m_name = "#{prefix}#{suffix}".to_sym
      define_method("#{prefix}#{suffix}") do |order|
        send_order_request(m_name, order)
      end
    end
  end

  def get_regions()
    xml_request = create_request(:get_regions)
    xml_request.auth.ukey = @ukey
    response = send_request(xml_request)
    AxiomusApi::RegionsResponse.new (response.body)
  end

  def status(okey)
    xml_request = create_request(:status)
    xml_request.auth = nil
    xml_request.okey = okey
    response = send_request(xml_request)
    status_response = AxiomusApi::StatusResponse.new(response.body)
    status_response
  end

  def status_list(okeys)
    xml_request = create_request(:status_list)
    xml_request.auth = nil
    xml_request.okeys = okeys
    response = send_request(xml_request)
    status_response = AxiomusApi::StatusListResponse.new(response.body)
    status_response
  end

  def get_version
    xml_request = create_request(:get_version)
    xml_request.auth = nil
    response = send_request(xml_request)
    version_response = AxiomusApi::VersionResponse.new(response.body)
    version_response.version
  end

  def send_order_request(mode, order)
    if(!order.valid?)
      error_msg = order.validation_errors.join('\n')
      logger.error(error_msg)
      raise AxiomusApi::Errors::ValidationError.new, order.validation_errors.join(error_msg)
    end

    xml_request = get_order_request(mode, order)
    response = send_request(xml_request)
    order_response = AxiomusApi::OrderResponse.new(response.body)

    if !order_response.success?
      log_response_error(order_response.error_message, xml_request.to_xml, response.body)
      raise AxiomusApi::Errors::RequestError.new(order_response.code), order_response.error_message
    end

    order_response
  end

  def labels_link(orders)
    "http://axiomus.ru/system/control/_call.php?mode=label&order=#{orders.join(',')}"
  end

  private

  def get_order_request(mode, order)
    xml_request = create_request(mode)
    xml_request.auth.ukey = @ukey
    xml_request.order = order
    xml_request.prepare_checksum(@uid)
    xml_request
  end

  def send_request(xml_request)
    connection = Net::HTTP.new(AxiomusApi::AXIOMUS_HOST, AxiomusApi::AXIOMUS_PORT)
    http_request = get_http_request(xml_request)
    logger.info("Request to #{xml_request.mode}")
    logger.debug("Request body: #{xml_request.to_xml(true)}")
    response = connection.request(http_request)
    logger.info("Response: #{response.code}")
    logger.debug("Response raw: #{response.body}")
    response.body.gsub!(/^.*<\?xml/, '<?xml')
    response
  end

  def api_path
    @test ? AxiomusApi::AXIOMUS_TEST_PATH : AxiomusApi::AXIOMUS_PROD_PATH
  end

  def get_http_request(xml_request)
    res = ::Net::HTTP::Post.new(api_path)
    res.body = "data=#{xml_request.to_xml(true)}"
    res
  end

  def logger
    ::AxiomusApi.logger
  end

  def log_response_error(description, xml_request, xml_response)
    logger.error(description)
    logger.error("Request body: #{xml_request}")
    logger.error("Response raw: #{xml_response}")
  end

end
