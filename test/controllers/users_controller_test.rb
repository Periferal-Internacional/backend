require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { admin: @user.admin, lastName1: @user.lastName1, lastName2: @user.lastName2, name: @user.name, password: @user.password, position: @user.position, username: @user.username } }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { admin: @user.admin, lastName1: @user.lastName1, lastName2: @user.lastName2, name: @user.name, password: @user.password, position: @user.position, username: @user.username } }, as: :json
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
