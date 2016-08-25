class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :writer_id
      t.string :image_url, default:""
      t.timestamps null: false
    end
  end
end
