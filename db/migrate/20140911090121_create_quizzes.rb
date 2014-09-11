class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :problem
      t.string :ans1
      t.string :ans2
      t.string :ans3
      t.string :ans4
      t.integer :correct_count,:default=>1
      t.integer :incorrect_count,:default=>1

      t.timestamps
    end
  end
end
