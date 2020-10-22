class CreateDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :diagnoses do |t|
      t.integer :x_axis
      t.integer :y_axis

      t.timestamps
    end
  end
end
