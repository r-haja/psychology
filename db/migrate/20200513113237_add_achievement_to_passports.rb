class AddAchievementToPassports < ActiveRecord::Migration[5.2]
  def change
    add_column :passports, :achievement, :boolean
  end
end
