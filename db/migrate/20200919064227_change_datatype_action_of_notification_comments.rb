class ChangeDatatypeActionOfNotificationComments < ActiveRecord::Migration[5.2]
  def change
    change_column :notification_comments, :action, :string
  end
end
