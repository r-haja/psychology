class Schedule < ApplicationRecord
  belongs_to :passport
  belongs_to :user

  def user_schedules(schedule, week)
    if schedule.present?
      week1_check = schedule.day+604800
      week2_check = schedule.day+1209600
      week3_check = schedule.day+1814400
      week4_check = schedule.day+2419200
      if week == 1
        if week1_check >= Date.today.to_time
          return true
        end
      elsif week == 2
        if week2_check >= Date.today.to_time && week1_check <= Date.today.to_time
          return true
        end
      elsif week == 3
        if week3_check >= Date.today.to_time && week2_check <= Date.today.to_time
          return true
        end
      elsif week == 4
        if week4_check >= Date.today.to_time && week3_check <= Date.today.to_time
          return true
        end
      end
    end
  end
end
