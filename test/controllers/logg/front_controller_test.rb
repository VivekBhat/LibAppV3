require 'test_helper'

class Logg::FrontControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get logg_front_index_url
    assert_response :success
  end

  test "should get show" do
    get logg_front_show_url
    assert_response :success
  end

end
