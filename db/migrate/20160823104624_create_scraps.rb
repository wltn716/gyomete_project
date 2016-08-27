class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.string :title
      t.string :nickname
      t.integer :time
      t.integer :likes
      t.integer :hits
      t.integer :replies
      t.integer :scrap_id
      t.integer :writer_id

      t.timestamps null: false
    end
  end
end
