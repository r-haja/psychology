class CreatePsychologies < ActiveRecord::Migration[5.2]
  def change
    create_table :psychologies do |t|
      t.string :title
      t.string :discription

      t.timestamps
    end
  end
end
