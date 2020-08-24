class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  def correct_user
    if current_user != @user
      redirect_to pictures_path
    end
  end
end
