require "test_helper"

class Admin::RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get admin_rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference('Room.count') do
      post admin_rooms_url, params: { room: {  } }
    end

    assert_redirected_to room_url(Room.last)
  end

  test "should show room" do
    get admin_room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    patch admin_room_url(@room), params: { room: {  } }
    assert_redirected_to room_url(@room)
  end

  test "should destroy room" do
    assert_difference('Room.count', -1) do
      delete admin_room_url(@room)
    end

    assert_redirected_to admin_rooms_url
  end
end
