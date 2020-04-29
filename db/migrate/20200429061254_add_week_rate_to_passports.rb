class AddWeekRateToPassports < ActiveRecord::Migration[5.2]
  def change
    add_column :passports, :week_rate, :integer
  end
end
