class AddReleaseToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :release, :boolean, default: true
  end
end
