class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :comment
      t.boolean :check, default: false, null: false
      t.references :passport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
