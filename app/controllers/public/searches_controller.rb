class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @categories = Category.all
    @latest_rooms = Room.order(created_at: :desc).limit(4)
    rooms = Room.where('rooms.title LIKE ?', "%#{params[:query]}%").page(params[:page]).per(6)
    case params[:sort]
    when 'likes'
    @results = rooms.left_joins(:likes).group('rooms.id').order('COUNT(likes.id) DESC')
    when 'bookmarks'
    @results = rooms.left_joins(:bookmarks).group('rooms.id').order('COUNT(bookmarks.id) DESC')
    else
    @results = rooms.order(created_at: :desc)
    end
  end
  
  def category_search
    @categories = Category.all
    @latest_rooms = Room.order(created_at: :desc).limit(4)
    category_id = params[:category_id]
		rooms = Room.joins(room_categories: :category).where(categories: { id: category_id }).page(params[:page]).per(6)
    case params[:sort]
    when 'likes'
    @rooms = rooms.left_joins(:likes).group('rooms.id').order('COUNT(likes.id) DESC')
    when 'bookmarks'
    @rooms = rooms.left_joins(:bookmarks).group('rooms.id').order('COUNT(bookmarks.id) DESC')
    else
    @rooms = rooms.order(created_at: :desc)
    end
  end
end
