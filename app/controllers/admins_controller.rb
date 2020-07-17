class AdminsController < ApplicationController
  def top
    @users = User.all
    @passports = Passport.all
    @passport_psychologies = PassportPsychology.all
    @user_rate = User.new().user_create_passport_rate(@users)
    @passport_select_psychology = Passport.new().passport_select_psychology(@passports)
    @passport_select_schedule = Passport.new().passport_select_schedule(@passports)
  end
end
