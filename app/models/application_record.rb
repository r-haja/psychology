class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def passport_achievement_count
    passports = current_user.passports
    @achievement_sum = passports.where(achievement: true).count
  end
end
