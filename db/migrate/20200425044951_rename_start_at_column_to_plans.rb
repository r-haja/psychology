class RenameStartAtColumnToPlans < ActiveRecord::Migration[5.2]
  def change
    rename_column :plans, :start_at, :start_time
    rename_column :plans, :end_at, :end_time
  end
end
