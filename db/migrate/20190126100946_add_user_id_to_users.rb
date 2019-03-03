class AddUserIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_id, :intger
  end
end
