class AddPassportFirstCreateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :passport_first_create, :datetime
  end
end
