require 'test_helper'

class BookingHistroysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_histroy = booking_histroys(:one)
  end

  test "should get index" do
    get booking_histroys_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_histroy_url
    assert_response :success
  end

  test "should create booking_histroy" do
    assert_difference('BookingHistroy.count') do
      post booking_histroys_url, params: { booking_histroy: { date: @booking_histroy.date, from: @booking_histroy.from, to: @booking_histroy.to } }
    end

    assert_redirected_to booking_histroy_url(BookingHistroy.last)
  end

  test "should show booking_histroy" do
    get booking_histroy_url(@booking_histroy)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_histroy_url(@booking_histroy)
    assert_response :success
  end

  test "should update booking_histroy" do
    patch booking_histroy_url(@booking_histroy), params: { booking_histroy: { date: @booking_histroy.date, from: @booking_histroy.from, to: @booking_histroy.to } }
    assert_redirected_to booking_histroy_url(@booking_histroy)
  end

  test "should destroy booking_histroy" do
    assert_difference('BookingHistroy.count', -1) do
      delete booking_histroy_url(@booking_histroy)
    end

    assert_redirected_to booking_histroys_url
  end
end
