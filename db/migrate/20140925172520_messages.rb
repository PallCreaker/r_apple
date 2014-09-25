class Messages < ActiveRecord::Migration
  def change
    rename_column :messages, :user_id, :from_id
    add_column :messages, :to_id, :integer, after: :from_id
  end
end
