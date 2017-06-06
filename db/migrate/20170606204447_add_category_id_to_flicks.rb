class AddCategoryIdToFlicks < ActiveRecord::Migration[5.1]
  def change
    add_column :flicks, :category_id, :integer
  end
end
