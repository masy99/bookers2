class RemoveImageIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :ImageId, :text
  end
end
