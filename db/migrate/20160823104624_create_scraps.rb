class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.string :title
      t.integer :scrap_id
      t.integer :writer_id

      t.timestamps null: false
    end
  end
end
