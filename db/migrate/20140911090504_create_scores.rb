class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer  :user_id
      t.integer :competition_id
      t.integer :score, default: 0
      t.timestamps
    end
    add_index :scores, :user_id
    add_index :scores, :competition_id
  end
end
