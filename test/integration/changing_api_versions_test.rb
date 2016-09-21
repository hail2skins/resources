require 'test_helper'

class ChangingApiVersionsTest < ActionDispatch::IntegrationTest
  setup { @ip = '123.123.123.123' }
  
  test 'returns version one via Accept header' do
    get '/api/systems', 
      params: {}, 
      headers: { 'REMOTE_ADDR' => @ip, 'Accept' => 'application/v1+json' }
    
    assert_equal 200, response.status
    assert_equal Mime[:json], response.content_type
  end


end
