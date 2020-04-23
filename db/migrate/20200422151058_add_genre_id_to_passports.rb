class AddGenreIdToPassports < ActiveRecord::Migration[5.2]
  def change
    add_reference :passports, :genre, foreign_key: true
  end
end
