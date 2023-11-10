class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
  @room = Room.find(params[:room_id])
  @comment = @room.comments.new(comment_params)
  @comment.user_id = current_user.id
  if @comment.save
    redirect_to request.referer
  else
    @room_new = Room.new
    @comments = @room.comments
    redirect_to new_room_path
  end
  end

 def destroy
  @room = Room.find(params[:room_id])
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to request.referer
 end

 private
 def comment_params
  params.require(:comment).permit(:comment)
 end
end