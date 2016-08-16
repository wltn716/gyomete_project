class AddColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :major, :string
    add_column :users, :nickname, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :string
  end
  
  def down
    remove_column :users, :major
    remove_column :users, :nickname
    remove_column :users, :uid
    remove_column :users, :provider
  end

end