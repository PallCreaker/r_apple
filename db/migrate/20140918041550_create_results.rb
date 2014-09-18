class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :competition_id
      t.integer :my_score_id
      t.integer :competition_score_id
      t.boolean :judge

      t.timestamps
    end
  end
end
