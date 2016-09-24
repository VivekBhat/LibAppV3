require 'test_helper'

class User::FrontControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_front_index_url
    assert_response :success
  end

  test "should get show" do
    get user_front_show_url
    assert_response :success
  end

end
