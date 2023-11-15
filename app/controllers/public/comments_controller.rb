class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
  @room = Room.find(params[:room_id])
  @comment = current_user.comments.new(comment_params)
  @comment.room_id = @room.id
  @comment.save
  redirect_to request.referer
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
