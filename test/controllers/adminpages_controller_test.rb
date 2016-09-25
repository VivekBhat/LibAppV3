require 'test_helper'

class AdminpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adminpage = adminpages(:one)
  end

  test "should get index" do
    get adminpages_url
    assert_response :success
  end

  test "should get new" do
    get new_adminpage_url
    assert_response :success
  end

  test "should create adminpage" do
    assert_difference('Adminpage.count') do
      post adminpages_url, params: { adminpage: { email: @adminpage.email, name: @adminpage.name, password: @adminpage.password } }
    end

    assert_redirected_to adminpage_url(Adminpage.last)
  end

  test "should show adminpage" do
    get adminpage_url(@adminpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_adminpage_url(@adminpage)
    assert_response :success
  end

  test "should update adminpage" do
    patch adminpage_url(@adminpage), params: { adminpage: { email: @adminpage.email, name: @adminpage.name, password: @adminpage.password } }
    assert_redirected_to adminpage_url(@adminpage)
  end

  test "should destroy adminpage" do
    assert_difference('Adminpage.count', -1) do
      delete adminpage_url(@adminpage)
    end

    assert_redirected_to adminpages_url
  end
end
