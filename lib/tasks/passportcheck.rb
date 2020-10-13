require "#{Rails.root}/app/models/passport"

class Tasks::Passportcheck
  def self.no_updated_schedule_check
    passports = Passport.all
    current_time = Time.now.strftime("%Y-%m-%d")
    passports.each do |passport|
      schedules = passport.schedules
      if schedules.where(day: current_time).present?
      else
        Notification.new().notification_create(passport)
      end
    end
  end
end
