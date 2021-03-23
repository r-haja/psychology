class SchedulesController < ApplicationController

  def create
    @schedules = Schedule.all.includes(:passport)
    @schedule = Schedule.new(params_schedule)
    @passport = @schedule.passport
    @notifications = @passport.notifications.where(check: false)
    if params[:commit] == "達成"
      @schedule.judgment = 1
    elsif params[:commit] == "例外日"
      @schedule.judgment = 3
    end
    if @schedule.save
      passport_rate
      if @schedule.day.strftime("%Y-%m-%d")  == Time.now.strftime("%Y-%m-%d")
        Notification.new().notification_create(@schedule.passport)
      end
      respond_to :js
    else
      flash[:notice] = "スケジュールの更新に失敗しました"
    end
  end

  def create_index
    @schedules = Schedule.all.includes(:passport)
    @schedule = Schedule.new(params_schedule_index)
    @passport = @schedule.passport
    @notifications = @passport.notifications.where(check: false)
    if params[:commit] == "達成"
      @schedule.judgment = 1
    elsif params[:commit] == "例外日"
      @schedule.judgment = 3
    end
    if @schedule.save
      passport_rate
      if @schedule.day.strftime("%Y-%m-%d")  == Time.now.strftime("%Y-%m-%d")
        Notification.new().notification_create(@schedule.passport)
      end
      respond_to :js
    else
      flash[:notice] = "スケジュールの更新に失敗しました"
    end
  end

  def update
    @schedules = Schedule.all.includes(:passport)
    @schedule = Schedule.find_by(id: params[:id])
    @passport = @schedule.passport
    if params[:commit] == "達成"
      @schedule.judgment = 1
    elsif params[:commit] == "取消"
      @schedule.judgment = 2
    elsif params[:commit] == "例外日"
      @schedule.judgment = 3
    end
    if @schedule.update(params_schedule_update)
      passport_rate
      respond_to :js
    else
      flash[:notice] = "スケジュールの更新に失敗しました"
    end
  end

  private
    def params_schedule
      params.require(:schedule).permit(:day, :comprate, :passport_id, :user_id, :judgment)
    end
    def params_schedule_index
      params.permit(:day, :comprate, :passport_id, :user_id, :judgment)
    end
    def params_schedule_update
      params.permit(:day, :comprate, :passport_id, :user_id, :judgment)
    end

    def passport_rate
      #Userが設定した開始日から終了日までの日数を計算
      @passports = Passport.find_by(id: params[:passport_id])
      start_time = @passport.plans.first.start_time
      end_time = @passport.plans.first.end_time
      #例外日の数計算
      exception_count = @passport.schedules.where(judgment: 3).count
      sum = (end_time - start_time)/86400 - exception_count
      success_rate = @passport.schedules.where(day: start_time..end_time).where(judgment: 1).count*100/sum
      @passport.rate = success_rate

      #今月の開始日と終了日の取得
      this_date = Date.today
      start_month_date = this_date.beginning_of_month.to_s
      end_month_date = this_date.end_of_month.to_s
      exception_count_month = @passport.schedules.where(day: start_month_date..end_month_date).where(judgment: 3).count
      sum_month = (this_date.end_of_month - this_date.beginning_of_month + 1).to_i - exception_count_month

      #月の成功率の計算
      success_rate_month = @passport.schedules.where(day: start_month_date..end_month_date).where(judgment: 1).count*100/sum_month
      @passport.month_rate = success_rate_month

      #週の開始日と終了日を計算
      start_week_date = this_date.beginning_of_week
      end_week_date = this_date.end_of_week
      exception_count_week = @passport.schedules.where(day: start_week_date.to_s..end_week_date.to_s).where(judgment: 3).count
      sum_week = (end_week_date - start_week_date + 1).to_i - exception_count_week

      #週の成功率を計算
      success_rate_week = @passport.schedules.where(day: start_week_date.to_s..end_week_date.to_s).where(judgment: 1).count*100/sum_week
      @passport.week_rate = success_rate_week

      @passport.save
    end
end
