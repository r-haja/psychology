class AddSelectPassportToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :select_passport, :integer
  end
end
