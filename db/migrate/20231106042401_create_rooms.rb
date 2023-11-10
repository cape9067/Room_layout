class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
