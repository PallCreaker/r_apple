class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :fb_id
      t.string :fb_name
      t.integer :status
      t.integer :conpetition
      t.string :university
      t.string :e_mail
      t.string :image

      t.timestamps
    end
  end
end
