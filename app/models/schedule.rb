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

  def schedule_count(notification)
    passport = notification.passport
    schedule = passport.schedules
    count = schedule.where(judgment: 1).count
    return count
  end

  def notification_rate(notification, days)
    passport =  notification.passport
    schedule = passport.schedules
    day = notification.created_at
    if days == 7
      this_monday = day - (day.wday - 1) #今週の月曜日
      count = schedule.where(day: this_monday..day).count
      rate = (count/7.to_f)*100
      return rate
    elsif days == 28
      start_month = day.beginning_of_month
      days_count = ((day - start_month)/24/60/60).ceil
      count = schedule.where(day: start_month..day).count
      rate = (count/days_count.to_f)*100
      return rate
    end
  end

  def schedule_day_of_the_week(notification)
    passport = notification.passport
    schedules = passport.schedules
    sun = 0
    mon = 0
    tue = 0
    wed = 0
    thu = 0
    fri = 0
    sat = 0
    schedules.each do |schedule, number|
      if schedule.day.strftime("%A") == "Sunday"
        sun += 1
      elsif schedule.day.strftime("%A") == "Monday"
        mon += 1
      elsif schedule.day.strftime("%A") == "Tuesday"
        tue += 1
      elsif schedule.day.strftime("%A") == "Wednesday"
        wed += 1
      elsif schedule.day.strftime("%A") == "Thursday"
        thu += 1
      elsif schedule.day.strftime("%A") == "Friday"
        fri += 1
      elsif schedule.day.strftime("%A") == "Saturday"
        sat += 1
      end
    end
    sum = (sun+mon+tue+wed+thu+fri+sat)
    sun_per = sun/sum.to_f*100
    mon_per = mon/sum.to_f*100
    tue_per = tue/sum.to_f*100
    wed_per = wed/sum.to_f*100
    thu_per = thu/sum.to_f*100
    fri_per = fri/sum.to_f*100
    sat_per = sat/sum.to_f*100
    hash = {"日曜日" =>sun_per, "月曜日" =>mon_per, "火曜日" =>tue_per, "水曜日" =>wed_per, "木曜日" =>thu_per, "金曜日" =>fri_per, "土曜日" =>sat_per}
    value = Hash[hash.sort_by{|_, v| -v}]
    return value
  end
end
