class SchedulesController < ApplicationController

  def create
    @schedules = Schedule.all.includes(:passport)
    @schedule = Schedule.new(params_schedule)
    @passport = @schedule.passport
    if @schedule.save
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
      respond_to :js
    else
      flash[:notice] = "失敗しました"
    end
  end

  private
    def params_schedule
      params.require(:schedule).permit(:day, :comprate, :passport_id, :user_id)
    end
end
