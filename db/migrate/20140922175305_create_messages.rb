class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.int :user_id
      t.int :partner_id
      t.string :content

      t.timestamps
    end
  end
end
