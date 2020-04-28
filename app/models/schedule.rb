class Schedule < ApplicationRecord
  belongs_to :passport
  belongs_to :user
end
