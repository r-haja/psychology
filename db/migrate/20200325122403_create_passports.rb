class CreatePassports < ActiveRecord::Migration[5.2]
  def change
    create_table :passports do |t|
      t.string :purpose, null: false
      t.string :goal, null: false
      t.string :passport_image
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
