# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController


protected

  def after_sign_in_path_for(resource)
    public_rooms_path
  end
end
