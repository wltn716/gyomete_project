class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|

      t.string :title
      t.text :content
      t.integer :hit, default: 0
      t.integer :like
      t.string :hashtag
      t.string :nickname
      

      t.timestamps null: false
    end
  end
end
