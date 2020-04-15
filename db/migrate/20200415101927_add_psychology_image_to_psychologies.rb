class AddPsychologyImageToPsychologies < ActiveRecord::Migration[5.2]
  def change
    add_column :psychologies, :psychology_image, :string
  end
end
