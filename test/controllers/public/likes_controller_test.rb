require "test_helper"

class Public::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
  end

  test "should get index" do
    get public_likes_url
    assert_response :success
  end

  test "should get new" do
    get new_public_like_url
    assert_response :success
  end

  test "should create like" do
    assert_difference('Like.count') do
      post public_likes_url, params: { like: {  } }
    end

    assert_redirected_to like_url(Like.last)
  end

  test "should show like" do
    get public_like_url(@like)
    assert_response :success
  end

  test "should get edit" do
    get edit_public_like_url(@like)
    assert_response :success
  end

  test "should update like" do
    patch public_like_url(@like), params: { like: {  } }
    assert_redirected_to like_url(@like)
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete public_like_url(@like)
    end

    assert_redirected_to public_likes_url
  end
end
