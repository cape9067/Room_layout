class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create]
  
  def create
  @room = Room.find(params[:room_id])
  @bookmark = @room.bookmarks.new(user_id: current_user.id)
  if @bookmark.save
    redirect_to request.referer
  else
    redirect_to request.referer
  end
  end

 def destroy
  @room = Room.find(params[:room_id])
  @bookmark = Bookmark.find(params[:id])
  if @bookmark.present?
  @bookmark.destroy
  end
  redirect_to request.referer
 end
 
 def index
   @user = User.find(params[:user_id])
 end
  private
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to request.referer , notice: "ゲストユーザーはマイリスト機能を使えません。"
    end
  end  
end