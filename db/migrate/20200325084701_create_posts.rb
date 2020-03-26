class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :dive_point
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
