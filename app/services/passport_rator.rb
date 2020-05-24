class PassportRator
  def initialize(passports)
    @passports = passports
  end
  def passport_rate
    @passports.each do |passport|
      #Userが設定した開始日から終了日までの日数を計算
      start_time = passport.plans.first.start_time
      end_time = passport.plans.first.end_time
      #例外日の数計算
      exception_count = passport.schedules.where(judgment: 3).count
      sum = (end_time - start_time)/86400 - exception_count
      success_rate = passport.schedules.where(day: start_time..end_time).where(judgment: 1).count*100/sum
      passport.rate = success_rate

      #今月の開始日と終了日の取得
      this_date = Date.today
      start_month_date = this_date.beginning_of_month.to_s
      end_month_date = this_date.end_of_month.to_s
      exception_count_month = passport.schedules.where(day: start_month_date..end_month_date).where(judgment: 3).count
      sum_month = (this_date.end_of_month - this_date.beginning_of_month + 1).to_i - exception_count_month

      #月の成功率の計算
      success_rate_month = passport.schedules.where(day: start_month_date..end_month_date).where(judgment: 1).count*100/sum_month
      passport.month_rate = success_rate_month

      #週の開始日と終了日を計算
      start_week_date = this_date.beginning_of_week
      end_week_date = this_date.end_of_week
      exception_count_week = passport.schedules.where(day: start_week_date.to_s..end_week_date.to_s).where(judgment: 3).count
      sum_week = (end_week_date - start_week_date + 1).to_i - exception_count_week

      #週の成功率を計算
      success_rate_week = passport.schedules.where(day: start_week_date.to_s..end_week_date.to_s).count*100/sum_week
      passport.week_rate = success_rate_week

      passport.save
    end
  end
end
