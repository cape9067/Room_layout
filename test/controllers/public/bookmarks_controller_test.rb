require "test_helper"

class Public::BookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookmark = bookmarks(:one)
  end

  test "should get index" do
    get public_bookmarks_url
    assert_response :success
  end

  test "should get new" do
    get new_public_bookmark_url
    assert_response :success
  end

  test "should create bookmark" do
    assert_difference('Bookmark.count') do
      post public_bookmarks_url, params: { bookmark: {  } }
    end

    assert_redirected_to bookmark_url(Bookmark.last)
  end

  test "should show bookmark" do
    get public_bookmark_url(@bookmark)
    assert_response :success
  end

  test "should get edit" do
    get edit_public_bookmark_url(@bookmark)
    assert_response :success
  end

  test "should update bookmark" do
    patch public_bookmark_url(@bookmark), params: { bookmark: {  } }
    assert_redirected_to bookmark_url(@bookmark)
  end

  test "should destroy bookmark" do
    assert_difference('Bookmark.count', -1) do
      delete public_bookmark_url(@bookmark)
    end

    assert_redirected_to public_bookmarks_url
  end
end
