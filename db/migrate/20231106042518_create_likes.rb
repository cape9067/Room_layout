class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :room_id
      t.string :ip 

      t.timestamps
    end
  end
end
