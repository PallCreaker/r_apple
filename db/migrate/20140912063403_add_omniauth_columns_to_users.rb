class AddOmniauthColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_id,    :string, null: false, default: ""
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :fb_name,     :string
    add_index :users, [:fb_id, :provider], unique: true
  end
end
