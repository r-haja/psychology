class PassportsController < ApplicationController
  before_action :authenticate_user!
  before_action :passport_set, only: [:show, :edit, :update, :destroy]

  def show
    if current_user.passports.present?
      @psychologies = Psychology.all
      @schedules = Schedule.all.includes(:passport)
    else
      redirect_to new_user_passport_path(current_user)
      flash[:notice] = "パスポートを作成しましょう！"
    end
  end

  def new
    if current_user.passports.present?
      redirect_to user_passport_path(current_user, current_user.passports.first.id)
    #  flash[:alert] = "すでにパスポートは作成済みです!"
    else
      @passport = current_user.passports.new
      @passport.plans.build
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

  def edit
  end

  def update
    if @passport.update(passport_params)
      redirect_to user_passport_path(current_user, current_user.passports.first.id)
    else
      render :show
    end
  end

private
  def passport_set
    @passport = Passport.find_by(id: params[:id])
  end

  def passport_params
    params.require(:passport).permit(:purpose ,:goal, :passport_image,:genre_id, psychology_ids: [], plans_attributes: [:start_time, :end_time])
  end
end
