class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :competition
      t.integer :my_score_id
      t.integer :competition_score_id
      t.boolean :decision

      t.timestamps
    end
    add_index :results, :my_score_id
    add_index :results, :competition_score_id
  end
end
