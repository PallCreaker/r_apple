class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_id
      t.references :competition
      t.integer :to_id
      t.string :content

      t.timestamps
    end
    add_index :messages, :from_id
    add_index :messages, :to_id
  end
end
