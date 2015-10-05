class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.integer :user_id
      t.integer :relative_id
      t.text :body

      t.timestamps null: false
    end
  end
end
