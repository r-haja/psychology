class PassportsController < ApplicationController
  before_action :authenticate_user!
  before_action :passport_set, only: [:edit, :update, :destroy]

  def index
    user = User.find_by(id: params[:user_id])
    if user.passports.present?
      @passports = user.passports
      rate = PassportRator.new(@passports)
      rate.passport_rate
      @psychologies = Psychology.all
      @schedules = Schedule.all.includes(:passport)
    else
      redirect_to new_user_passport_path(current_user)
      flash[:notice] = "パスポートを作成しましょう！"
    end
  end

  def new
    @passport = current_user.passports.new
    @passport.plans.build
  end

  def create
    @passport = current_user.passports.new(passport_params)
    if @passport.save
      flash[:notice] = "習慣化パスポートを保存しました！"
      redirect_to user_passports_path(current_user)
    else
      flash[:alert] = "入力誤りがあります。再度記入してください。"
      render :new
    end
  end

  def destroy
    if @passport.destroy
      redirect_to user_passports_path(current_user)
    else
      flash[:notice] = "パスポートの削除に失敗しました。"
      render :index
    end
  end

  def edit
    if current_user.passports.present?
    else
      redirect_to new_user_passport_path(current_user)
    end
  end

  def update
    if params[:passport][:purpose]
      if @passport.update(passport_params)
        @passport.plans.first.destroy
        redirect_to user_passports_path(current_user)
      else
        redirect_to user_passports_path(current_user)
      end
    else
      if @passport.update(passport_params)
        redirect_to user_passports_path(current_user)
      else
        redirect_to user_passports_path(current_user)
      end
    end
  end

private
  def passport_set
    @passport = Passport.find_by(id: params[:id])
  end

  def passport_params
    params.require(:passport).permit(:purpose , :goal, :passport_image, :genre_id, :achievement, psychology_ids: [], plans_attributes: [:start_time, :end_time])
  end
end
