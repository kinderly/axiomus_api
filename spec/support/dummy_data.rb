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
      <courier>
        <city city_code='21'>King's Landing</city>
      </courier>
      <pickup>
        <office office_code='44' city_code='21'>Office 2</office>
      </pickup>
    </region>
  </response>
  XML

  STATUS_SUCCESS_RESPONSE = <<-XML
    <?xml version="1.0" encoding="utf-8"?>
    <response>
      <request>status</request>
      <order id="1013" inner_id="16777" price="156.83" />
      <status code="211">расчет за доставку</status>
      <refused_items>
        <item name="mbon" quantity="2" price="34.4"/>
      </refused_items>
      <packs>
        <pack number="32" places="1" status="1"/>
      </packs>
      <d_date>2011-03-17</d_date>
      <poststatus tracking="32167" postprice="34.3"/>
    </response>
  XML

end
