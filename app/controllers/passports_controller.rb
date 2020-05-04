class PassportsController < ApplicationController
  before_action :authenticate_user!
  before_action :passport_set, only: [:show, :edit, :update, :destroy]
  before_action :passport_rate, only: [:show], if: -> { current_user.passports.present? }

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
      flash[:alert] = "入力誤りがあります。再度記入してください。"
      render :new
    end
  end

  def destroy
    if @passport.destroy
      redirect_to new_user_passport_path(current_user)
    else
      flash[:notice] = "パスポートの削除に失敗しました。"
      render :show
    end
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
    params.require(:passport).permit(:purpose , :goal, :passport_image, :genre_id, psychology_ids: [], plans_attributes: [:start_time, :end_time])
  end

  def passport_rate
    #Userが設定した開始日から終了日までの日数を計算
    @passport = Passport.find_by(id: params[:id])
    #start_time = @passport.plans.first.start_time
    #end_time = @passport.plans.first.end_time
    #sum = (end_time - start_time)/86400

    #今月の開始日と終了日の取得
    this_date = Date.today
    start_month_date = this_date.beginning_of_month.to_s
    end_month_date = this_date.end_of_month.to_s
    sum_month = (this_date.end_of_month - this_date.beginning_of_month + 1).to_i

    #月の成功率の計算
    success_rate_month = @passport.schedules.where(day: start_month_date..end_month_date).count*100/sum_month
    @passport.rate = success_rate_month

    #週の開始日と終了日を計算
    start_week_date = this_date.beginning_of_week.to_s
    end_week_date = this_date.end_of_week.to_s

    #週の成功率を計算
    success_rate_week = @passport.schedules.where(day: start_week_date..end_week_date).count*100/7
    @passport.week_rate = success_rate_week

    @passport.save
  end
end
