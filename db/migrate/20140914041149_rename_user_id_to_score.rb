class RenameUserIdToScore < ActiveRecord::Migration
  def up
	  rename_column :scores,:user_id,:uid
  end
  def down
	  rename_column :scores,:uid,:user_id
  end
  def change
	  change_column :scores,:uid,:string
  end
end
