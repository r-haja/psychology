class AddJudgmentToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :judgment, :integer
  end
end
