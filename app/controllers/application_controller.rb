class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def correct_user
     if current_user.id != @picture.user_id
       flash[:notice] = "権限がないです"
       redirect_to pictures_path
     end
  end
end
