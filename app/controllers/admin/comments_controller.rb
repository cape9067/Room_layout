class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @comments = Comment.all
  end
  
  def destroy
    flash[:success] = "コメントを削除しました。"
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
end
