class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :datetime
    add_column :users, :sex, :string
  end
end
