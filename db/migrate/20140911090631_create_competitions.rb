class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.references :user
      t.integer :enemy_id
      t.boolean :is_fin,:default=>false

      t.timestamps
    end
    add_index :competitions, :enemy_id
  end
end
