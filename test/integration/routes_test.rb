require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'defaults to v1' do
    assert_generates '/api/systems', { controller: 'api/v1/systems', action: 'index' }
  end
end