class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!

  # GET /categories or /categories.json
  def index
    @categories = Category.all.page(params[:page]).per(10)
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "作成されました。"
      redirect_to admin_categories_path
    else
      flash[:danger] = "作成に失敗しました。"
      @categories = Category.all
      render "index"
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
  @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "アップデートされました。"
    redirect_to admin_categories_path
    else
      flash[:danger] = "アップデートに失敗しました。"
    render "edit"
    end
  end


  private

    def category_params
    params.require(:category).permit(:name)
    end
    
end
