class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create, :index]
  
  def create
  @room = Room.find(params[:room_id])
  @bookmark = Bookmark.new(user_id: current_user.id, room_id: params[:room_id])
  @bookmark.save
  end

 def destroy
  @room = Room.find(params[:room_id])
  @bookmark = Bookmark.find_by(user_id: current_user.id, room_id: params[:room_id])
  if @bookmark.present?
  @bookmark.destroy
  end
 end
 
 def index
   @user = User.find(params[:user_id])
   @rooms = @user.bookmarked_rooms.order(created_at: :desc).page(params[:page]).per(6)
 end
 
  private
  
 def ensure_guest_user
   if current_user.guest_user?
     redirect_to request.referer, alert: "会員限定の機能です。"
   end
 end

 def bookmark_params
   @bookmark = Room.find(params[:room_id])
 end
end