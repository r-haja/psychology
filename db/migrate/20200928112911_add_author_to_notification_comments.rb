class AddAuthorToNotificationComments < ActiveRecord::Migration[5.2]
  def change
    add_column :notification_comments, :author, :string
  end
end
