# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Quiz.create(problem:"apple", ans1:"りんご", ans2:"なし", ans3:"ぶどう", ans4:"パイナップル")
Quiz.create(problem:"apple", ans1:"りんご", ans2:"なし", ans3:"ぶどう", ans4:"パイナップル")
Quiz.create(problem:"apple", ans1:"りんご", ans2:"なし", ans3:"ぶどう", ans4:"パイナップル")
Quiz.create(problem:"apple", ans1:"りんご", ans2:"なし", ans3:"ぶどう", ans4:"パイナップル")
Quiz.create(problem:"apple", ans1:"りんご", ans2:"なし", ans3:"ぶどう", ans4:"パイナップル")
Competition.create(user_id: 1, competition_id: 1)
Score.create(user_id: 1,score: 990)
Score.create(user_id: 1,score: 90)
Result.create(competition_id:1, my_score_id: 1, competition_score_id:1, judge:true)
Result.create(competition_id:1, my_score_id: 1, competition_score_id:1, judge:true)

User.create(user_name:"たなか",university:"doshisha",gender:1,password:"11111111",email: 'hoge@example.com')
#User.create(user_name:"すずき",university:"doshisha",gender:1,password:"11111111",email: 'hogehoge@example.com')
