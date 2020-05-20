class AddEmailMagazineToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :email_magazine, :boolean, default: true, null: false
  end
end
