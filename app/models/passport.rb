class Passport < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :plans, dependent: :destroy
  has_many :schedules, dependent: :destroy

  has_many :passport_psychologies, dependent: :destroy
  has_many :psychologies, through: :passport_psychologies

  delegate :start_time,
           :end_time,
           :to => :plan,
           :prefix => true

  delegate :name,
           :profile_image,
           :to => :user,
           :prefix => true

  accepts_nested_attributes_for :passport_psychologies

  validates :purpose, presence: true
  validates :goal, presence: true

  mount_uploader :passport_image, PassportImageUploader
  accepts_nested_attributes_for :plans, allow_destroy: true

  def start_time(passport)
    plans.first.start_time_to_s(passport)
  end

  def end_time(passport)
    plans.first.end_time_to_s(passport)
  end

  def passport_psychologies_default_set(passport)
    if passport.genre.name = "運動"
  #    passport.psychology_ids = [4,9,10]
    elsif passport.genre.name = "睡眠"
      passport.psychology_ids = [2,7,11]
    elsif passport.genre.name = "早起き"
      passport.psychology_ids = [5,2,8]
    elsif passport.genre.name = "勉強"
      passport.psychology_ids = [1,3,7]
    elsif passport.genre.name = "読書"
      passport.psychology_ids = [1,3,4]
    elsif passport.genre.name = "ダイエット"
      passport.psychology_ids = [5,9,14]
    elsif passport.genre.name = "瞑想"
      passport.psychology_ids = [3,4,8]
    elsif passport.genre.name = "家事"
      passport.psychology_ids = [3,6,10]
    elsif passport.genre.name = "悪い習慣"
      passport.psychology_ids = [13,5,]
    end
  end

end
