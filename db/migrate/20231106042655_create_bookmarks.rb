class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
