class AddCompratePassportSelectToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :comprate_passport_select, :integer
  end
end
