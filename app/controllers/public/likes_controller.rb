class Public::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
  @room = Room.find(params[:room_id])
  @like = Like.new(room_id: params[:room_id], ip: request.remote_ip)
  @like.save
  end

  def destroy
  @room = Room.find(params[:room_id])
  @alreadylike = Like.find_by(ip: request.remote_ip, room_id: params[:room_id])
  if @alreadylike.present?
  @alreadylike.destroy
  end
  end
  
end