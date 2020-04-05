class PassportsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.passports.present?
      @passport = Passport.find_by(id: params[:id])
    else
      redirect_to new_user_passport_path(current_user)
      flash[:notice] = "パスポートを作成しましょう！"
    end
  end

  def new
    if current_user.passports.present?
      redirect_to user_passport_path(current_user, current_user.passports.first.id)
      flash[:alert] = "すでにパスポートは作成済みです!"
    else
      @passport = current_user.passports.new
    end
  end

  def create
    @passport = current_user.passports.new(passport_params)
    if @passport.save
      flash[:notice] = "習慣化パスポートを保存しました！"
      redirect_to user_passport_path(current_user, current_user.passports.first.id)
    else
      render :new
    end
  end

  def destroy
  end

private
  def passport_params
    params.require(:passport).permit(:purpose ,:goal, :passport_image)
  end
end
