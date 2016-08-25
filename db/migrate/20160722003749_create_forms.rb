class CreateForms < ActiveRecord::Migration
  
  def change
    create_table :forms do |t|

      t.string :title
      t.text :content
      t.integer :hit, default: 0
      t.integer :like
      t.integer :category
      t.string :hashtag
      t.string :nickname
      t.integer :writer_id
      

      t.timestamps null: false
    end
  end
end
