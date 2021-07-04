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
    day = notification.day
    if days == 7
      this_monday = day.beginning_of_week #今週の月曜日
      this_sunday = day.end_of_week #今週の日曜日
      count = schedule.where(judgment: 1, day: this_monday..this_sunday).count
      exception_day_count = schedule.where(judgment: 3, day: this_monday..this_sunday).count
      week_days_count = 7 - exception_day_count
      rate = (count/week_days_count.to_f)*100
      return rate
    elsif days == 28
      start_month = day.beginning_of_month
      end_month = day.end_of_month
      count = schedule.where(judgment: 1, day: start_month..end_month).count
      exception_day_count = schedule.where(judgment: 3, day: start_month..end_month).count
      days_count = (end_month - start_month).to_i + 1 - exception_day_count
      rate = (count/days_count.to_f)*100
      return rate
    end
  end

  def schedule_day_of_the_week(notification)
    passport = notification.passport
    this_month_start = notification.day.beginning_of_month
    this_month_end = notification.day.end_of_month
    schedules = passport.schedules.where(judgment: 1, day: this_month_start..this_month_end)
    sun = 0
    mon = 0
    tue = 0
    wed = 0
    thu = 0
    fri = 0
    sat = 0
    schedules.each do |schedule|
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
    num = { "月曜日" =>mon,
            "火曜日" =>tue, "水曜日" =>wed,
            "木曜日" =>thu, "金曜日" =>fri,
            "土曜日" =>sat, "日曜日" =>sun}
    hash = {"月曜日" =>mon_per.to_i,
            "火曜日" =>tue_per.to_i, "水曜日" =>wed_per.to_i,
            "木曜日" =>thu_per.to_i, "金曜日" =>fri_per.to_i,
            "土曜日" =>sat_per.to_i, "日曜日" =>sun_per.to_i}
    sort_hash = Hash[hash.sort_by{|_, v| -v}]
    hash_top = sort_hash.to_a[0]+sort_hash.to_a[1]+sort_hash.to_a[2]
    hash_lower = sort_hash.to_a[3]+sort_hash.to_a[4]+sort_hash.to_a[5]+sort_hash.to_a[6]
    return hash, num
  end

  def prev_schedule_day_of_the_week(notification)
    passport = notification.passport
    prev_month_start = notification.day.prev_month.beginning_of_month
    prev_month_end = notification.day.prev_month.end_of_month
    schedules = passport.schedules.where(judgment: 1, day: prev_month_start..prev_month_end)
    sun = 0
    mon = 0
    tue = 0
    wed = 0
    thu = 0
    fri = 0
    sat = 0
    schedules.each do |schedule|
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
    num = {"日曜日" =>sun, "月曜日" =>mon,
            "火曜日" =>tue, "水曜日" =>wed,
            "木曜日" =>thu, "金曜日" =>fri,
            "土曜日" =>sat}
    return num
  end

  def working_hours(notification)
    passport = notification.passport
    schedules = passport.schedules
    day = notification.day
    start_week = day.beginning_of_week
    end_week = day.end_of_week
    this_week_schedules = schedules.where(judgment: 1, day: start_week..end_week)
    sun_time = 0
    mon_time = 0
    tue_time = 0
    wed_time = 0
    thu_time = 0
    fri_time = 0
    sat_time = 0
    this_week_schedules.each do |schedule|
      if schedule.day.strftime("%A") == "Sunday"
        sun_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Monday"
        mon_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Tuesday"
        tue_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Wednesday"
        wed_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Thursday"
        thu_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Friday"
        fri_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Saturday"
        sat_time = schedule.created_at.hour
      end
    end
    week_time = {"月曜日" =>mon_time,
            "火曜日" =>tue_time, "水曜日" =>wed_time,
            "木曜日" =>thu_time, "金曜日" =>fri_time,
            "土曜日" =>sat_time, "日曜日" =>sun_time,}
    return week_time
  end

  def prev_working_hours(notification)
    passport = notification.passport
    schedules = passport.schedules
    day = notification.day
    start_week = day.prev_week(:monday)
    end_week = day.prev_week(:sunday)
    this_week_schedules = schedules.where(judgment: 1, day: start_week..end_week)
    sun_time = 0
    mon_time = 0
    tue_time = 0
    wed_time = 0
    thu_time = 0
    fri_time = 0
    sat_time = 0
    this_week_schedules.each do |schedule|
      if schedule.day.strftime("%A") == "Sunday"
        sun_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Monday"
        mon_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Tuesday"
        tue_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Wednesday"
        wed_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Thursday"
        thu_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Friday"
        fri_time = schedule.created_at.hour
      elsif schedule.day.strftime("%A") == "Saturday"
        sat_time = schedule.created_at.hour
      end
    end
    week_time = {"日曜日" =>sun_time, "月曜日" =>mon_time,
            "火曜日" =>tue_time, "水曜日" =>wed_time,
            "木曜日" =>thu_time, "金曜日" =>fri_time,
            "土曜日" =>sat_time}
    return week_time
  end
end
