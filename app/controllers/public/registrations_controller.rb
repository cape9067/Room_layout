# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  
  def after_sign_in_path_for(resource)
    public_rooms_path
  end
  
end
