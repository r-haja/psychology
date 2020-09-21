class AddDetailsToNotificationComment < ActiveRecord::Migration[5.2]
  def change
    add_column :notification_comments, :action, :integer
  end
end
