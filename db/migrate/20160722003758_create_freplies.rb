class CreateFreplies < ActiveRecord::Migration
  def change
    create_table :freplies do |t|
      
      t.string :content
      t.integer :form_id
      t.integer :writer_id
      
      t.timestamps null: false
    end
  end
end
