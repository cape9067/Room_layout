require "test_helper"

class Public::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get public_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_public_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post public_comments_url, params: { comment: {  } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get public_comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_public_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch public_comment_url(@comment), params: { comment: {  } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete public_comment_url(@comment)
    end

    assert_redirected_to public_comments_url
  end
end
