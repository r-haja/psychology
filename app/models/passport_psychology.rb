class PassportPsychology < ApplicationRecord
  belongs_to :passport
  belongs_to :psychology

  validates :passport_id, :uniqueness => { :scope => :psychology_id }

  def passport_select_psychology(passport_psychologies, passports, psychology_number)
    sum = passport_psychologies.where(psychology_id: psychology_number).count
    select_rate = sum.to_f/passports.count.to_f
    return select_rate*100
  end

  def psychology_ranking(passports)
    passport_psychology = []
    passports.each do |passport|
      passport_psychology += passport.psychology_ids
    end
    return passport_psychology.each_with_object(Hash.new(0)){|v,o| o[v]+=1}
  end
end
