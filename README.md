### Project Information  
+ [資料](https://docs.google.com/spreadsheets/d/1d4AhH4I6dsT9CJAYDs0M3aKhiBbJoF2o_bQZzX9XaeQ/edit?usp=sharing)  
+ コミュニケーション=>Slack  
+ プロジェクト管理,コード管理=>GitHub & trello
+ [タスク管理はここで](https://trello.com/b/TGUOzsS9/todo)
+ [参考になったURLはここにナレッジためていこう](https://github.com/RHDHR/r_apple/wiki)

### 環境構築の仕方
```
git clone git@github.com:RHDHR/r_apple.git
cp config/database.yml.sample config/database.yml
vim config/database.yml # 環境に合わせて修正
bundle install --path vendor/bundle
rake db:create # bundle exec rake db:create でも。
rake db:migrate
rake db:seed
```

### 開発環境（各自のローカル）
+ OS:各自のMacOS
+ Web server: WEBrick
+ DB: MySQL

### 本番環境（構成中）
+ Platform: AWS
+ OS:(EC2)CentOS
+ DB:(RDS)MySQL
+ Webサーバ: Nginx+Unicorn
