require 'test_helper'

class Admin::FrontControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_front_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_front_show_url
    assert_response :success
  end

end
