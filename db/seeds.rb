# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(user_name:"たなか",university:"doshisha",gender:1,password:"11111111",email:"hoge@example.com",fb_id:"aaa",provider:"facebook", image:"http://graph.facebook.com/1480912385495090/picture")
User.create(user_name:"すずき",university:"doshisha",gender:1,password:"11111111",email:"hogehoge@example.com",fb_id:"bbb",provider:"facebook", image:"http://graph.facebook.com/1480912385495090/picture")
User.create(user_name:"きむら",university:"doshisha",gender:1,password:"11111111",email:"hogehogehoge@example.com",fb_id:"ggg",provider:"facebook", image:"http://graph.facebook.com/1480912385495090/picture")
User.create(user_name:"ささき",university:"doshisha",gender:1,password:"11111111",email:"sasaki@example.com",fb_id:"ccc",provider:"facebook", image:"http://graph.facebook.com/1480912385495090/picture")
User.create(user_name:"かとう",university:"keio",gender:1,password:"11111111",email:"kato@example.com",fb_id:"ddd",provider:"facebook", image:"http://graph.facebook.com/1480912385495090/picture")
User.create(user_name:"さいとう",university:"waseda",gender:1,password:"11111111",email:"saito@example.com",fb_id:"eee",provider:"facebook", image:"http://graph.facebook.com/1480912385495090/picture")
User.create(user_name:"こんどう",university:"waseda",gender:1,password:"11111111",email:"kondo@example.com",fb_id:"fff",provider:"facebook", image:"http://graph.facebook.com/1480912385495090/picture")

Competition.create(user_id: 1, competition_id: 1)
Competition.create(user_id: 2, competition_id: 3)
Competition.create(user_id: 4, competition_id: 3)

Score.create(user_id: 1,score: 990)
Score.create(user_id: 1,score: 90)
Score.create(user_id: 2,score: 950)
Score.create(user_id: 2,score: 800)
Score.create(user_id: 3,score: 50)
Score.create(user_id: 3,score: 10)
Score.create(user_id: 4,score: 200)
Score.create(user_id: 5,score: 300)
Score.create(user_id: 6,score: 300)
Score.create(user_id: 7,score: 500)

Result.create(competition_id:1, my_score_id: 1, competition_score_id:3, decision:false)
Result.create(competition_id:1, my_score_id: 1, competition_score_id:3, decision:false)
Result.create(competition_id:1, my_score_id: 1, competition_score_id:3, decision:true)
Result.create(competition_id:1, my_score_id: 1, competition_score_id:3, decision:true)
Result.create(competition_id:2, my_score_id: 2, competition_score_id:1, decision:false)
Result.create(competition_id:2, my_score_id: 2, competition_score_id:1, decision:true)
Result.create(competition_id:2, my_score_id: 2, competition_score_id:1, decision:false)
Result.create(competition_id:2, my_score_id: 2, competition_score_id:1, decision:true)

Quiz.create(problem:"gross", ans1:"総計の", ans2:"世界の", ans3:"草", ans4:"接続")
Quiz.create(problem:"conscious", ans1:"意識のある", ans2:"感謝", ans3:"継続", ans4:"注意")
Quiz.create(problem:"cruel", ans1:"悪意のある", ans2:"驚愕", ans3:"子犬", ans4:"黒い")
Quiz.create(problem:"funeral", ans1:"葬式", ans2:"楽器", ans3:"苦い", ans4:"燃料")
Quiz.create(problem:"odd", ans1:"変な、奇怪な", ans2:"加える", ans3:"量", ans4:"驚く")
Quiz.create(problem:"offend", ans1:"責める", ans2:"思惑する", ans3:"勧誘する", ans4:"守る")
Quiz.create(problem:"principle", ans1:"原理、原則", ans2:"主な、校長", ans3:"姫", ans4:"プリン")
Quiz.create(problem:"rub", ans1:"こする、磨く", ans2:"愛", ans3:"睡魔", ans4:"抜く")
Quiz.create(problem:"atomic", ans1:"原子の", ans2:"機材", ans3:"物欲", ans4:"迷惑な")
Quiz.create(problem:"vast", ans1:"広大な", ans2:"胸", ans3:"公共の", ans4:"健全な")
Quiz.create(problem:"draft", ans1:"草案、下書き、叫び", ans2:"壮大な", ans3:"不思議な", ans4:"継続的な")
Quiz.create(problem:"abstract", ans1:"抽象的な", ans2:"自動的な", ans3:"複合的な", ans4:"攻める")
Quiz.create(problem:"coincidence", ans1:"同時に発生する", ans2:"空虚", ans3:"複製", ans4:"協力")
Quiz.create(problem:"flock ", ans1:"群れ", ans2:"蛙", ans3:"国旗", ans4:"伝記")
Quiz.create(problem:"glance ", ans1:"ちらっと見る", ans2:"総計", ans3:"目標", ans4:"勧告")
Quiz.create(problem:"mount", ans1:"積もる", ans2:"渓谷", ans3:"ぼやけた", ans4:"票")
Quiz.create(problem:"vague", ans1:"ぼやけた", ans2:"再開", ans3:"雨漏り", ans4:"不甲斐ない")
Quiz.create(problem:"yield", ans1:"産出する", ans2:"概念", ans3:"未来", ans4:"ワキ")
Quiz.create(problem:"keen", ans1:"熱心な", ans2:"冷たい", ans3:"突然の", ans4:"冷酷な")
Quiz.create(problem:"organ", ans1:"内蔵、臓器", ans2:"ニンニク", ans3:"管", ans4:"血流")
Quiz.create(problem:"accuse", ans1:"訴える、非難する", ans2:"生産する", ans3:"原稿", ans4:"広大な")
Quiz.create(problem:"cling", ans1:"しがみつく", ans2:"結びつける", ans3:"丸くなる", ans4:"球体")
Quiz.create(problem:"generous", ans1:"寛大な", ans2:"最高の", ans3:"元気な", ans4:"普段の")
Quiz.create(problem:"pale", ans1:"青ざめた", ans2:"なし", ans3:"漂白する", ans4:"困惑する")
Quiz.create(problem:"complaint ", ans1:"文句、苦情", ans2:"内容", ans3:"構造", ans4:"敵")
Quiz.create(problem:"ease", ans1:"和らげる、くつろいで", ans2:"消滅", ans3:"創出する", ans4:"摘む")
Quiz.create(problem:"spell", ans1:"詳しく話す", ans2:"英語のつづり", ans3:"書く", ans4:"拡散する")
Quiz.create(problem:"ambulance", ans1:"救急車", ans2:"法律", ans3:"地位", ans4:"利用")
Quiz.create(problem:"represent", ans1:"代表", ans2:"贈り返す", ans3:"繰り返す", ans4:"偶然")
Quiz.create(problem:"install", ans1:"就任させる、取付ける", ans2:"分解する", ans3:"中に入る", ans4:"修復する")
Quiz.create(problem:"index", ans1:"索引、目盛り", ans2:"流行", ans3:"穂先", ans4:"内側の")
Quiz.create(problem:"recruit", ans1:"募る、新兵", ans2:"上場する", ans3:"企業", ans4:"巨大な")
Quiz.create(problem:"stream", ans1:"小川、流れ", ans2:"小石", ans3:"繋がり", ans4:"旗")
Quiz.create(problem:"envelope", ans1:"封筒", ans2:"高貴な", ans3:"成長する", ans4:"不幸")
Quiz.create(problem:"pardon", ans1:"許し、許す", ans2:"聞こえない", ans3:"理解", ans4:"親和性")
Quiz.create(problem:"dig", ans1:"掘る", ans2:"切り裂く", ans3:"連続", ans4:"永久")
Quiz.create(problem:"domestic", ans1:"家庭内の、国内の", ans2:"暴力", ans3:"道理", ans4:"確実な")
