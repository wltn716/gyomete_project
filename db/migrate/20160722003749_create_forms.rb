class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|

      t.string :title
      t.text :content
      t.integer :hit
      t.integer :like
      t.string :hashtag
      

      t.timestamps null: false
    end
  end
end
