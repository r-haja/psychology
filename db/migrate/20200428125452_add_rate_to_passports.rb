class AddRateToPassports < ActiveRecord::Migration[5.2]
  def change
    add_column :passports, :rate, :integer
  end
end
