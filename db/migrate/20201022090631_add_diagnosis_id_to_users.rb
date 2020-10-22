class AddDiagnosisIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :diagnosis_id, :integer
  end
end
