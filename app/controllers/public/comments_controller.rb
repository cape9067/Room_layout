class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:index]

  def create
  @room = Room.find(params[:room_id])
  @comment = current_user.comments.new(comment_params)
  @comment.room_id = @room.id
  if @comment.save
   flash.now[:notice] = "コメントの投稿に成功しました。"
  else
   flash.now[:alert] ="コメントの投稿に失敗しました。"
  end
  end

 def destroy
  @room = Room.find(params[:room_id])
  @comment = @room.comments.find(params[:id])
  respond_to do |format|
  @comment.destroy
  format.html { redirect_to request.referer }
  format.js
 end
 end

 def index
  @room = Room.find(params[:room_id])
  @comments = @room.comments.all
  @comment = Comment.new
 end

 private


 def comment_params
  params.require(:comment).permit(:comment)
 end

 def ensure_guest_user
 @user = current_user
 if @user.guest_user?
  @isGuest = true
 end
 end

end
