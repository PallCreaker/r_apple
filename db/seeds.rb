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

Competition.create(user_id: 1, competition_id: 2)
Competition.create(user_id: 2, competition_id: 3)
Competition.create(user_id: 4, competition_id: 3)

Score.create(user_id: 1,score: 990)
Score.create(user_id: 1,score: 90)
Score.create(user_id: 2,score: 950)
Score.create(user_id: 2,score: 800)
Score.create(user_id: 3,score: 700)
Score.create(user_id: 4,score: 600)

Result.create(competition_id:1, my_score_id: 1, competition_score_id:3, decision:true)

User.create(user_name:"たなか",university:"doshisha",gender:1,password:"11111111",email:"hoge@example.com",fb_id:"aaa",provider:"facebook")
User.create(user_name:"すずき",university:"doshisha",gender:1,password:"11111111",email:"hogehoge@example.com",fb_id:"bbb",provider:"facebook")
User.create(user_name:"ささき",university:"keio",gender:1,password:"11111111",email:"sasaki@example.com",fb_id:"ccc",provider:"facebook")
User.create(user_name:"かとう",university:"keio",gender:1,password:"11111111",email:"kato@example.com",fb_id:"ddd",provider:"facebook")
User.create(user_name:"さいとう",university:"waseda",gender:1,password:"11111111",email:"saito@example.com",fb_id:"eee",provider:"facebook")
User.create(user_name:"こんどう",university:"waseda",gender:1,password:"11111111",email:"kondo@example.com",fb_id:"fff",provider:"facebook")