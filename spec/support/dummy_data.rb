# coding: utf-8

module DummyData

  def self.order_success_response(mode = :new)
    ORDER_SUCCESS_RESPONSE % {:mode => mode}
  end

  def self.order_error_response(mode = 'new', code = 1, description = 'Ошибка')
    ORDER_ERROR_RESPONSE % {:mode => mode, :code => code, :description => description}
  end

  def self.basic_order(type = AxiomusApi::BaseOrder, service_type = AxiomusApi::Services, item_type = AxiomusApi::Item)
    res = type.new
    res.inner_id = '11111'
    res.name = 'John Galt'
    res.from_mkad = 2
    res.places = 1
    res.city = 0
    res.sms = '79034000000'
    res.sms_sender = 'Mbon'
    res.garden_ring = 'no'
    res.contacts = 'John Galt'
    res.description = 'Fragile.'
    res.services = service_type.new.tap do |s|
      s.big = 'yes'
    end
    res.items = [
      item_type.new.tap do |it|
        it.name = 'Magic Wand'
        it.weight = 0.4
        it.quantity = 2
        it.price = 1000.2
      end,

      item_type.new.tap do |it|
        it.name = 'Magic Hat'
        it.weight = 0.3
        it.quantity = 4
        it.price = 3000.49
      end
    ]
    res
  end

  ORDER_SUCCESS_RESPONSE = <<-XML
  <?xml version='1.0' standalone='yes'?>
  <response>
    <request>%{mode}</request>
    <auth objectid="1234567">642d208495dtgu8906e7dff9f98764da</auth>
    <status price="100.00" code="0">Запрос выполнен успешно</status>
  </response>
  XML

  ORDER_ERROR_RESPONSE = <<-XML
  <?xml version='1.0' standalone='yes'?>
  <response>
    <request>%{mode}</request>
    <status code="%{code}">%{description}</status>
  </response>
  XML

  REGIONS_SUCCESS_RESPONSE = <<-XML
  <?xml version='1.0' standalone='yes'?>
  <response>
    <region region_code='21' name='Волшебная страна'>
    </region>
  </response>
  XML

end
