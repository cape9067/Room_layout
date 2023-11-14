class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:create]
  
  def create
  @bookmark = Bookmark.new(user_id: current_user.id, room_id: params[:room_id])
  @bookmark.save
  redirect_to request.referer
  end

 def destroy
  @bookmark = Bookmark.find_by(user_id: current_user.id, room_id: params[:room_id])
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
   if current_user.guest_user?
     redirect_to request.referer, notice: "ゲストユーザーはブックマーク機能を使えません。"
   end
 end

 def bookmark_params
   @bookmark = Room.find(params[:room_id])
 end
end