class Public::LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
  @room = Room.find(params[:room_id])
  @like = Like.new(ip: request.remote_ip, room_id: @room.id)
  @like.save
  redirect_to request.referer
  end

 def destroy
  @room = Room.find(params[:room_id])
  @like = Like.find_by(ip: request.remote_ip, room_id: @room.id)
  if @like.present?
  @like.destroy
  end
  redirect_to request.referer
 end
end