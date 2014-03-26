# coding: utf-8

module DummyData

  def self.order_success_response(mode = :new)
    ORDER_SUCCESS_RESPONSE % {:mode => mode}
  end

  def self.order_error_response(mode = 'new', code = 1, description = 'Ошибка')
    ORDER_ERROR_RESPONSE % {:mode => mode, :code => code, :description => description}
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
