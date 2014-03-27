module AxiomusApi
  AXIOMUS_PROD_PATH = '/hydra/api_xml.php'
  AXIOMUS_TEST_PATH = '/test/api_xml_test.php'
  AXIOMUS_HOST = 'axiomus.ru'
  AXIOMUS_PORT = 80
  AXIOMUS_TEST_CREDENTIALS = {ukey: 'XXcd208495d565ef66e7dff9f98764XX', uid: '92'}
end

require_relative('axiomus_api/serializable')
require_relative('axiomus_api/base')
require_relative('axiomus_api/base_order.rb')
require_relative('axiomus_api/request.rb')
require_relative('axiomus_api/order_request.rb')
require_relative('axiomus_api/status_request.rb')
require_relative('axiomus_api/actions.rb')
Dir.glob(File.join(File.dirname(__FILE__),'axiomus_api/*.rb')).each do |file|
  require_relative(file)
end

