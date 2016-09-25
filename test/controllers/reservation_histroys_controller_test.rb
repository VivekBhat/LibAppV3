require 'test_helper'

class ReservationHistroysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation_histroy = reservation_histroys(:one)
  end

  test "should get index" do
    get reservation_histroys_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_histroy_url
    assert_response :success
  end

  test "should create reservation_histroy" do
    assert_difference('ReservationHistroy.count') do
      post reservation_histroys_url, params: { reservation_histroy: { date: @reservation_histroy.date, from: @reservation_histroy.from, rooms_id: @reservation_histroy.rooms_id, to: @reservation_histroy.to, users_id: @reservation_histroy.users_id } }
    end

    assert_redirected_to reservation_histroy_url(ReservationHistroy.last)
  end

  test "should show reservation_histroy" do
    get reservation_histroy_url(@reservation_histroy)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_histroy_url(@reservation_histroy)
    assert_response :success
  end

  test "should update reservation_histroy" do
    patch reservation_histroy_url(@reservation_histroy), params: { reservation_histroy: { date: @reservation_histroy.date, from: @reservation_histroy.from, rooms_id: @reservation_histroy.rooms_id, to: @reservation_histroy.to, users_id: @reservation_histroy.users_id } }
    assert_redirected_to reservation_histroy_url(@reservation_histroy)
  end

  test "should destroy reservation_histroy" do
    assert_difference('ReservationHistroy.count', -1) do
      delete reservation_histroy_url(@reservation_histroy)
    end

    assert_redirected_to reservation_histroys_url
  end
end
