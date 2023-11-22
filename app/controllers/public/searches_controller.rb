class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @categories = Category.all
    @latest_rooms = Room.order(created_at: :desc).limit(4)
    case params[:sort]
    when 'likes'
    @results = Room.left_joins(:likes).group('rooms.id').order('COUNT(likes.id) DESC').where('rooms.title LIKE ?', "%#{params[:query]}%").page(params[:page]).per(6)
    when 'bookmarks'
    @results = Room.left_joins(:bookmarks).group('rooms.id').order('COUNT(bookmarks.id) DESC').where('rooms.title LIKE ?', "%#{params[:query]}%").page(params[:page]).per(6)
    else
    @results = Room.where('rooms.title LIKE ?', "%#{params[:query]}%").order(created_at: :desc).page(params[:page]).per(6)
    end
  end
end
