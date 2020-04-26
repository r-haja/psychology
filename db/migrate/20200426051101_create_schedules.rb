class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :day
      t.boolean :comprate
      t.references :passport, foreign_key: true

      t.timestamps
    end
  end
end
