class CreateNotificationComments < ActiveRecord::Migration[5.2]
  def change
    create_table :notification_comments do |t|
      t.string :comment
      t.string :date_type

      t.timestamps
    end
  end
end
