class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :passport, foreign_key: true

      t.timestamps
    end
  end
end
