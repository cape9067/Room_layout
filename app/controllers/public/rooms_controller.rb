class Public::RoomsController < ApplicationController
  before_action :authenticate_user!

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
    @categories = Category.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @room = Room.find(params[:id])
    @comments = @room.comments
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @categories = Category.all
  end

  # GET /rooms/1/edit
  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(room_params)
      if @room.save
        flash[:success] = "投稿されました！"
      redirect_to public_rooms_path
      else
        @categories = Category.all
        render 'new'
      end
  end

  def update
     @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:success] = "投稿内容がアップデートされました！"
      redirect_to public_room_path(@room)
    else
      flash.now[:danger] = "投稿内容の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    flash[:success] = "投稿を削除しました。"
    room = Room.find(params[:id])
    room.destroy
    redirect_to public_room_path(room)
  end

  private
    def room_params
      params.require(:room).permit(:image, :title, :body, :category_id).merge(user_id: current_user.id)
    end
end
