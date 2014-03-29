require 'net/http'
require_relative 'actions'
require_relative 'regions_response'
require_relative 'status_response'
require_relative 'order_response'

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

  def new(order)
    send_order_request(:new, order)
  end

  def update(order)
    send_order_request(:update, order)
  end

  def new_carry(order)
    send_order_request(:new_carry, order)
  end

  def update_carry(order)
    send_order_request(:update_carry, order)
  end

  def new_export(order)
    send_order_request(:new_export, order)
  end

  def update_export(order)
    send_order_request(:update_export, order)
  end

  def new_self_export(order)
    send_order_request(:new_self_export, order)
  end

  def update_self_export(order)
    send_order_request(:update_self_export, order)
  end

  def new_post(order)
    send_order_request(:new_post, order)
  end

  def update_post(order)
    send_order_request(:update_post, order)
  end

  def new_ems(order)
    send_order_request(:new_ems, order)
  end

  def update_ems(order)
    send_order_request(:update_ems, order)
  end

  def get_regions()
    xml_request = create_request(:get_regions)
    xml_request.auth.ukey = @ukey
    response = send_request(xml_request)
    AxiomusApi::RegionsResponse.new (response.body)
  end

  def new_region_courier(order)
    send_order_request(:new_region_courier, order)
  end

  def update_region_courier(order)
    send_order_request(:update_region_courier, order)
  end

  def new_region_pickup(order)
    send_order_request(:new_region_pickup, order)
  end

  def update_region_pickup(order)
    send_order_request(:update_region_pickup, order)
  end

  def status(okey)
    xml_request = create_request(:status)
    xml_request.auth = nil
    xml_request.okey = okey
    response = send_request(xml_request)
    AxiomusApi::StatusResponse.new(response.body)
  end

  def send_order_request(mode, order)
    xml_request = get_order_request(mode, order)
    response = send_request(xml_request)
    order_response = AxiomusApi::OrderResponse.new(response.body)

    if !order_response.success?
      logger.error(order_response.error_message)
      logger.error("Request body: #{xml_request.to_xml}")
      logger.error("Response raw: #{response.body}")
      raise AxiomusApi::Errors::OrderRequestError.new(order_response.code), order_response.error_message
    end

    order_response
  end

  private

  def get_order_request(mode, order)
    xml_request = create_request(:new)
    xml_request.auth.ukey = @ukey
    xml_request.order = order
    xml_request.prepare_checksum(@uid)
    xml_request
  end

  def send_request(xml_request)
    connection = Net::HTTP.new(AxiomusApi::AXIOMUS_HOST, AxiomusApi::AXIOMUS_PORT)
    http_request = get_http_request(xml_request)
    logger.info("Request to #{xml_request.mode}")
    logger.debug("Request body: #{xml_request.to_xml}")
    response = connection.request(http_request)
    logger.info("Response: #{response.code}")
    logger.debug("Response raw: #{response.body}")
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

end
