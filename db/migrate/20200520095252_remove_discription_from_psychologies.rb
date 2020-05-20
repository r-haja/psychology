class RemoveDiscriptionFromPsychologies < ActiveRecord::Migration[5.2]
  def change
    remove_column :psychologies, :discription, :string
  end
end
