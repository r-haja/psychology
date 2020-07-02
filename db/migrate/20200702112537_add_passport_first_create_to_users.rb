class AddPassportFirstCreateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :passport_first_create, :date
  end
end
