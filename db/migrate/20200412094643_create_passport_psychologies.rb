class CreatePassportPsychologies < ActiveRecord::Migration[5.2]
  def change
    create_table :passport_psychologies do |t|
      t.references :passport, foreign_key: true
      t.references :psychology, foreign_key: true

      t.timestamps
    end
  end
end
