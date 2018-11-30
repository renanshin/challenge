require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @order.imei = 75757
    @order.parcel_number = 1
    @order.price = 9.99
    @order.status = 1
  end

  test "should get index" do
    get api_v1_orders_path, as: :json
    assert_response :success
  end

  test "should show order" do
    get api_v1_orders_path(@order), as: :json
    assert_response :success
  end

  test "should update order" do
    patch api_v1_order_path(@order), params: { order: { cel_model: @order.cel_model, imei: @order.imei, parcel_number: @order.parcel_number, price: @order.price, status: @order.status, user_id: @order.user_id } }, as: :json
    assert_response 200
  end

end
