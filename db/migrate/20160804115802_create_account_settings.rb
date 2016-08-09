class CreateAccountSettings < ActiveRecord::Migration
  def change
    create_table :account_settings do |t|

      t.timestamps null: false
    end
  end
end
