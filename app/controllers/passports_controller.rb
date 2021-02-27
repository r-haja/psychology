class PassportsController < ApplicationController
  before_action :authenticate_user!
  before_action :passport_set, only: [:show, :edit, :update, :destroy, :comprated]

  def index
    passport_index_comprate
  end

  def show
    @notifications = @passport.notifications.where(check: false)
  end

  def comprated
    passport_index_comprate
  end

  def new
    @passport = current_user.passports.new
    @passport.plans.build
  end

  def create
    @passport = current_user.passports.new(passport_params)
    if @passport.save
      current_user.select_passport = @passport.id
      current_user.save
      #@passport.passport_psychologies_default_set(@passport)
      flash[:notice] = "習慣化パスポートを保存しました！"
      redirect_to user_passport_path(current_user, @passport)
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
      render :show
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
        redirect_to user_passport_path(current_user, @passport)
      else
        redirect_to user_passport_path(current_user, @passport)
      end
    else
      if params[:passport][:achievement].present?
        if @passport.update(passport_params)
          redirect_to user_passport_passport_comprated_path(current_user, @passport)
        else
          redirect_to user_passport_path(current_user, @passport)
        end
      elsif params[:passport][:achievement].blank? == true
        if @passport.update(passport_params)
          redirect_to user_passport_path(current_user, @passport)
        else
          redirect_to user_passport_path(current_user, @passport)
        end
      else
        if @passport.update(passport_params)
          redirect_to user_passport_path(current_user, @passport)
        else
          redirect_to user_passport_path(current_user, @passport)
        end
      end
    end
  end

private

  def passport_index_comprate
    user = User.find_by(id: params[:user_id])
    if user.id == current_user.id
      if user.passports.present?
        user_release?(user)
      else
        redirect_to new_user_passport_path(current_user)
        flash[:notice] = "パスポートを作成しましょう！"
      end
    elsif user.release == true
      if user.passports.present?
        user_release?(user)
      else
        redirect_to posts_path
        flash[:alert] = "#{user.name}さんはPassportを作成していません。"
      end
    else
      redirect_to posts_path
      flash[:alert] = "#{user.name}さんはPassportの閲覧を許可していません。"
    end
  end

  def user_release?(user)
    @passports = user.passports
    @passport_comprate = @passports.where(achievement: true)

    rate = PassportRator.new(@passports)
    rate.passport_rate
    @psychologies = Psychology.all
    @schedules = Schedule.all.includes(:passport)
  #  if Schedule.find_by(day: Time.now.strftime("%Y-%m-%d"))
  #    @schedule = Schedule.find_by(day: Time.now.strftime("%Y-%m-%d"))
  #  else
  #    @schedule = Schedule.new
  #  end
  end

  def passport_set
    @passport = Passport.find_by(id: params[:id])
    if @passport == nil
      @passport = Passport.find_by(id: params[:passport_id])
    end
  end

  def passport_params
    params.require(:passport).permit(:purpose , :goal, :passport_image, :genre_id, :achievement, psychology_ids: [], plans_attributes: [:start_time, :end_time])
  end
end
