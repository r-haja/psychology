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

  def passport_select_psychology(passports)
    sum = 0
    passports.each do |passport|
      if passport.passport_psychologies.present? == true
        sum += 1
      end
    end
    select_rate = sum.to_f/passports.count.to_f
    return select_rate*100
  end

  def passport_select_schedule(passports)
    sum = 0
    passports.each do |passport|
      if passport.schedules.present? == true
        sum += 1
      end
    end
    select_rate = sum.to_f/passports.count.to_f
    return select_rate*100
  end
  def passport_select_genre(passports, genre_number)
    sum = passports.where(genre_id: genre_number).count
    select_rate = sum.to_f/passports.count.to_f
    return select_rate*100
  end

  def passport_psychology_ranking(passports, number)
    sccess_passports = passports.where(rate: 0..Float::INFINITY)
    genre_passports = sccess_passports.where(genre_id: number)
    #ランキング形式で表示する仕様が必要。
    psychologies = PassportPsychology.new().psychology_ranking(genre_passports)
    psychology_sort = psychologies.sort{|(k1, v1), (k2, v2)| v2 <=> v1}
    psychology_sort.first(5).each do |psychology|
      #raise
      psychology[0] = Psychology.find(psychology[0]).title
      psychology[1] = (psychology[1].to_f/genre_passports.count*100).round(2)
    end
    return psychology_sort
  end
end
