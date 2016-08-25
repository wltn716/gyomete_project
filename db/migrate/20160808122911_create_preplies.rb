class CreatePreplies < ActiveRecord::Migration
  def change
    create_table :preplies do |t|
      t.text :content
      t.integer :post_id
      t.integer :writer_id
      t.timestamps null: false
    end
  end
end
