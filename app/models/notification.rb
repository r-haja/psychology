class Notification < ApplicationRecord
  belongs_to :passport
  belongs_to :notification_comment

  validates :day, presence: true
  validates :date_type, presence: true


  def notification_create(passport)
    date_count = (Date.today.to_time - passport.plans.first.start_time.strftime("%Y-%m-%d").to_time)/60/60/24+1
    now = Date.today
    if passport.notifications.present?
      notification_reset(passport)
    end
  if date_count == 4 && now == now.end_of_month #4日目と月末がかぶった場合
    notification_4 = Notification.new(day: Date.today.to_time, date_type: 4, passport_id: passport.id)
    notification_4.notification_comment_id = notification_comments(notification_4, passport)
    notification_month = Notification.new(day: Date.today.to_time, date_type: 28, passport_id: passport.id)
    notification_month.notification_comment_id = notification_comments(notification_month, passport)
    notification_4.save
    notification_month.save
  elsif date_count == 3 && now == now.end_of_month #3日目と月末がかぶった場合
    notification_3 = Notification.new(day: Date.today.to_time, date_type: 3, passport_id: passport.id)
    notification_3.notification_comment_id = notification_comments(notification_3, passport)
    notification_month = Notification.new(day: Date.today.to_time, date_type: 28, passport_id: passport.id)
    notification_month.notification_comment_id = notification_comments(notification_month, passport)
    notification_3.save
    notification_month.save

  elsif date_count == 4  && now == now.end_of_week #4日目と週末がかぶった場合
    notification_4 = Notification.new(day: Date.today.to_time, date_type: 4, passport_id: passport.id)
    notification_4.notification_comment_id = notification_comments(notification_4, passport)
    notification_week = Notification.new(day: Date.today.to_time, date_type: 7, passport_id: passport.id)
    notification_week.notification_comment_id = notification_comments(notification_week, passport)
    notification_4.save
    notification_week.save

  elsif date_count == 3  && now == now.end_of_week #3日目と週末がかぶった場合
    notification_3 = Notification.new(day: Date.today.to_time, date_type: 3, passport_id: passport.id)
    notification_3.notification_comment_id = notification_comments(notification_3, passport)
    notification_week = Notification.new(day: Date.today.to_time, date_type: 7, passport_id: passport.id)
    notification_week.notification_comment_id = notification_comments(notification_week, passport)
    notification_3.save
    notification_week.save

    elsif date_count == 4 #date_type:4　
      notification = Notification.new(day: Date.today.to_time, date_type: 4, passport_id: passport.id)
      notification.notification_comment_id = notification_comments(notification, passport)
      notification.save
    elsif date_count == 3 #date_type:3
      notification = Notification.new(day: Date.today.to_time, date_type: 3, passport_id: passport.id)
      notification.notification_comment_id = notification_comments(notification, passport)
      notification.save
    elsif now == now.end_of_month  #date_type:28
      notification = Notification.new(day: Date.today.to_time, date_type: 28, passport_id: passport.id)
      notification.notification_comment_id = notification_comments(notification, passport)
      notification.save
    elsif now == now.end_of_week #date_type:7
      notification = Notification.new(day: Date.today.to_time, date_type: 7, passport_id: passport.id)
      notification.notification_comment_id = notification_comments(notification, passport)
      notification.save
    else #date_type:1
      notification = Notification.new(day: Date.today.to_time, date_type: 1, passport_id: passport.id)
      notification.notification_comment_id = notification_comments(notification, passport)
      notification.save
    end
  end


  def notification_comments(notification, passport)
    if notification.date_type == 4
      comments = NotificationComment.all
      comment_4 = comments.where(date_type: "4日")
      comment = comment_4.order("RANDOM()").first
      return comment.id
    elsif notification.date_type == 3
      comments = NotificationComment.all
      comment_3 = comments.where(date_type: "3日")
      comment = comment_3.order("RANDOM()").first
      return comment.id
    elsif notification.date_type == 28
      comments = NotificationComment.all
      comment_month = comments.where(date_type: "月")
      if passport.month_rate >= 100
        comment_random = comment_month.where(action: "100").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.month_rate >= 85
        comment_random = comment_month.where(action: "85").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.month_rate >= 71
        comment_random = comment_month.where(action: "71").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.month_rate >= 57
        comment_random = comment_month.where(action: "57").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.month_rate >= 42
        comment_random = comment_month.where(action: "42").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.month_rate >= 28
        comment_random = comment_month.where(action: "28").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.month_rate >= 14
        comment_random = comment_month.where(action: "14").first
        #comment = comment_random.order("RANDOM()").first
      else
        comment_random = comment_month.where(action: "0").first
        #comment = comment_random.order("RANDOM()").first
      end
      return comment_random.id

    elsif notification.date_type == 7
      comments = NotificationComment.all
      comment_week = comments.where(date_type: "週")
      if passport.week_rate >= 100
        comment_random = comment_week.where(action: "100").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.week_rate >= 85
        comment_random = comment_week.where(action: "85").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.week_rate >= 71
        comment_random = comment_week.where(action: "71").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.week_rate >= 57
        comment_random = comment_week.where(action: "57").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.week_rate >= 42
        comment_random = comment_week.where(action: "42").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.week_rate >= 28
        comment_random = comment_week.where(action: "28").first
        #comment = comment_random.order("RANDOM()").first
      elsif passport.week_rate >= 14
        comment_random = comment_week.where(action: "14").first
        #comment = comment_random.order("RANDOM()").first
      else
        comment_random = comment_week.where(action: "0").first
        #comment = comment_random.order("RANDOM()").first
      end
      return comment_random.id
    else
      comments = NotificationComment.all
      comment_random = comments.where(date_type: "日")
      comment = comment_random.order("RAND()").first
      return comment.id
    end
  end
end

def notification_reset(passport)
  notifications = passport.notifications
  if notifications.where(check: false, date_type: 1 || 7 || 28)
    notifications.where(check: false, date_type: 1 || 7 || 28).update_all(:check => true)
  end
end
