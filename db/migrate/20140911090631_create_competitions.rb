class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :user_id
      t.integer :competition_id
      t.boolean :is_fin,:default=>false

      t.timestamps
    end
  end
end
