class AddMonthRateToPassports < ActiveRecord::Migration[5.2]
  def change
    add_column :passports, :month_rate, :integer
  end
end
