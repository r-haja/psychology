class AddSelectPassportToPassports < ActiveRecord::Migration[5.2]
  def change
    add_column :passports, :select_passport, :boolean
  end
end
