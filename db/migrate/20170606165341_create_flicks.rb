class CreateFlicks < ActiveRecord::Migration[5.1]
  def change
    create_table :flicks do |t|
      t.string :title
      t.text :description
      t.string :director

      t.timestamps
    end
  end
end
