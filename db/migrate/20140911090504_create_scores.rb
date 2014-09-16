class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string  :user_id
      t.integer :competition_id
      t.integer :score
      t.timestamps
    end
  end
end
