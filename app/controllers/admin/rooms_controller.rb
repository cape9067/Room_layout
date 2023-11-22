class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @rooms = Room.all.page(params[:page]).per(10)
  end

  def show
    @room = Room.find(params[:id])
  end

  def destroy
    flash[:success] = "投稿を削除しました。"
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to request.referer
  end
end
