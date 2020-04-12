class PassportPsychology < ApplicationRecord
  belongs_to :passport
  belongs_to :psychology

  validates :passport_id, :uniqueness => { :scope => :psychology_id }
end
