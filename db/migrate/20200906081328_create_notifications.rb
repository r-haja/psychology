class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.date :day
      t.integer :date_type
      t.boolean :check, default: false, null: false
      t.references :passport, foreign_key: true
      t.references :notification_comment, foreign_key: true

      t.timestamps
    end
  end
end
