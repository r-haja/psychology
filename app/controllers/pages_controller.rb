class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to user_passports_path(current_user)
    end
  end

  def porpose_create
  end
end
