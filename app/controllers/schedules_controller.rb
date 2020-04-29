class SchedulesController < ApplicationController

  def create
    @schedule = Schedule.new(params_schedule)
    @passport = @schedule.passport
    if @schedule.save
      respond_to :js
    else
      flash[:notice] = "失敗しました"
    end
  end

  def destroy
    @schedule = Schedule.find_by(id: params[:id])
    @passport = @schedule.passport
    if @schedule.destroy
      redirect_to user_passport_path(current_user, current_user.passports.first.id)
    else
      flash[:notice] = "失敗しました"
    end
  end

  private
    def params_schedule
      params.require(:schedule).permit(:day, :comprate, :passport_id, :user_id)
    end
end
