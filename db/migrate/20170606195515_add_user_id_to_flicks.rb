class AddUserIdToFlicks < ActiveRecord::Migration[5.1]
  def change
    add_column :flicks, :user_id, :integer
  end
end
