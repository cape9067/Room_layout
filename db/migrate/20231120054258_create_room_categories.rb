class CreateRoomCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :room_categories do |t|
      t.references :room, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
