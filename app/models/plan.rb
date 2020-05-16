class Plan < ApplicationRecord
  belongs_to :passport

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_end_check
  #validate :start_time_cannot_be_int_the_past

  def start_end_check
    if start_time.present? && end_time.present?
      if self.start_time > self.end_time
        errors.add(:end_time, "の日付を正しく記入してください。")
      end
    end
  end

  #def start_time_cannot_be_int_the_past
  #  if start_time.present? && start_time < Date.today
  #    errors.add(:start_time, "の日付を正しく記入してください。")
  #  end
  #end
end
