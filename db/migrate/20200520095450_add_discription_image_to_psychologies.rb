class AddDiscriptionImageToPsychologies < ActiveRecord::Migration[5.2]
  def change
    add_column :psychologies, :discription_image, :string
  end
end
