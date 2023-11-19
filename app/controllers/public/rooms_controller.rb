class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:show]

  # GET /rooms or /rooms.json
  def index
    @categories = Category.all
    @latest_rooms = Room.order(created_at: :desc).limit(4)
    case params[:sort]
    when 'likes'
    @rooms = Room.left_joins(:likes).group('rooms.id').order('COUNT(likes.id) DESC')
    when 'bookmarks'
    @rooms = Room.left_joins(:bookmarks).group('rooms.id').order('COUNT(bookmarks.id) DESC')
    else
    @rooms = Room.order(created_at: :desc)
    end
  end


  # GET /rooms/1 or /rooms/1.json
  def show
    @room = Room.find(params[:id])
    @comments = Comment.where(room_id: params[:room_id]).order(id: :asc).limit(3)
    @comment = Comment.new
    @categories = Category.all
    @rooms = Room.all
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
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to public_rooms_path
  end

  private
    def room_params
      params.require(:room).permit(:title, :body, :category_id, :sort, images: []).merge(user_id: current_user.id)
    end

    def ensure_guest_user
    @user = current_user
    if @user.guest_user?
      @isGuest = true
    end
    end
end
