class AddDetailToDiagnoses < ActiveRecord::Migration[5.2]
  def change
    add_column :diagnoses, :x_axis1, :integer
    add_column :diagnoses, :x_axis2, :integer
    add_column :diagnoses, :y_axis1, :integer
    add_column :diagnoses, :y_axis2, :integer
  end
end
