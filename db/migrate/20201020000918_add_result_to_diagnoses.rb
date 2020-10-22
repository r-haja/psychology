class AddResultToDiagnoses < ActiveRecord::Migration[5.2]
  def change
    add_column :diagnoses, :result, :string
  end
end
