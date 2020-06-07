class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to user_passports_path(current_user)
    else
      redirect_to root_path
    end
  end
end
