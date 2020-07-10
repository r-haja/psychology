class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :passport_achievement_count, if: :user_signed_in?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      user_passports_path(current_user)
    end
  end

  def passport_achievement_count
    passports = current_user.passports
    @achievement_sum = passports.where(achievement: true).count
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :sex])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image, :email_magazine, :release, :select_passport,
                                        :comprate_passport_select, :passport_first_create, :passport_first_create_btn])
    end
end
