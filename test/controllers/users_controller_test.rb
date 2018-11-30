require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.name = 'Nome teste'
    @user.email = 'email@email.com'
    @user.cpf = 45645
  end

  test "should get index" do
    get api_v1_users_path, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post api_v1_users_path, params: { user: { cpf: users(:one).cpf, email: @user.email, name: @user.name } }, as: :json

    end

    assert_response 201
  end

  test "should show user" do
    get api_v1_users_path(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch api_v1_user_path(@user), params: { user: { cpf: @user.cpf, email: @user.email, name: @user.name } }, as: :json
    assert_response 200
  end

end
