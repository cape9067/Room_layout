class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:index]

  def create
  @room = Room.find(params[:room_id])
  @comment = current_user.comments.new(comment_params)
  @comment.room_id = @room.id
  respond_to do |format|
  if @comment.save
   flash.now[:success] =  "コメントの投稿に成功しました。"
   format.html { redirect_to request.referer }
  format.js
  else
   flash.now[:danger] ="コメントの投稿に失敗しました。"
     format.html { redirect_to request.referer }
  format.js
  end
  end
  end

 def destroy
  @room = Room.find(params[:room_id])
  @comment = @room.comments.find(params[:id])
  if @comment.user == current_user
   @comment.destroy
   flash.now[:success] =  "コメントを削除しました。"
   respond_to do |format|
     format.html { redirect_to request.referer }
     format.js
   end
  else
   flash.now[:danger] = "本人以外はコメントを削除できません。"
   redirect_to request.referer
  end
 end

 def index
  @room = Room.find(params[:room_id])
  @comments = @room.comments.all.page(params[:page]).per(10)
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
