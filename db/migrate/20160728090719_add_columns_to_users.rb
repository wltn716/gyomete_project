class AddColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :major, :string
    add_column :users, :nickname, :string
  end
  
  def down
    remove_column :users, :major
    remove_column :users, :nickname
  end

end
