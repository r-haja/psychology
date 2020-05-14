class SchedulesController < ApplicationController

  def create
    @schedules = Schedule.all.includes(:passport)
    @schedule = Schedule.new(params_schedule)
    @passport = @schedule.passport
    if @schedule.save
      passport_rate
      respond_to :js
    else
      flash[:notice] = "失敗しました"
    end
  end

  def destroy
    @schedules = Schedule.all.includes(:passport)
    @schedule = Schedule.find_by(id: params[:id])
    @passport = @schedule.passport
    if @schedule.destroy
      passport_rate
      respond_to :js
    else
      flash[:notice] = "失敗しました"
    end
  end

  private
    def params_schedule
      params.require(:schedule).permit(:day, :comprate, :passport_id, :user_id)
    end

    def passport_rate
      #Userが設定した開始日から終了日までの日数を計算
      @passport = Passport.find_by(id: params[:passport_id])
      start_time = @passport.plans.first.start_time
      end_time = @passport.plans.first.end_time
      sum = (end_time - start_time)/86400
      success_rate = @passport.schedules.where(day: start_time..end_time).count*100/sum
      @passport.rate = success_rate

      #今月の開始日と終了日の取得
      this_date = Date.today
      start_month_date = this_date.beginning_of_month.to_s
      end_month_date = this_date.end_of_month.to_s
      sum_month = (this_date.end_of_month - this_date.beginning_of_month + 1).to_i

      #月の成功率の計算
      success_rate_month = @passport.schedules.where(day: start_month_date..end_month_date).count*100/sum_month
      @passport.month_rate = success_rate_month

      #週の開始日と終了日を計算
      start_week_date = this_date.beginning_of_week.to_s
      end_week_date = this_date.end_of_week.to_s

      #週の成功率を計算
      success_rate_week = @passport.schedules.where(day: start_week_date..end_week_date).count*100/7
      @passport.week_rate = success_rate_week

      @passport.save
    end
end
