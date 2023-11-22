class Admin::UsersController < ApplicationController

  # GET /users or /users.json
  def index
    @users = User.all.page(params[:page]).per(10)
  end

end
