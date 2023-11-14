class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
  @room = Room.find(params[:room_id])
  @alreadylike = Like.find_by(ip: request.remote_ip, room_id: params[:room_id])
  if @alreadylike
     redirect_to request.referer
     flash[:notice] = "すでにいいねしています"
  else
     @like = Like.create(room_id: params[:room_id], ip: request.remote_ip)
     redirect_to request.referer
  end
  end

  def destroy
  @room = Room.find(params[:room_id])
  @alreadylike = Like.find_by(ip: request.remote_ip, room_id: params[:room_id])
  if @alreadylike.present?
  @alreadylike.destroy
     redirect_to request.referer
  else
     flash[:notice] = "すでにいいねしています"
     redirect_to request.referer
  end
  end
  
end