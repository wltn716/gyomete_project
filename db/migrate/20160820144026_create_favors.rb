class CreateFavors < ActiveRecord::Migration
  def change
    create_table :favors do |t|
      t.integer :form_id
      t.integer :liker_id

      t.timestamps null: false
    end
  end
end
