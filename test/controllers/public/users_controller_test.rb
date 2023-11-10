require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get public_users_url
    assert_response :success
  end

  test "should get new" do
    get new_public_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post public_users_url, params: { user: {  } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get public_user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_public_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch public_user_url(@user), params: { user: {  } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete public_user_url(@user)
    end

    assert_redirected_to public_users_url
  end
end
