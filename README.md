### Project Information  
+ コミュニケーション=>Slack  
+ プロジェクト管理,コード管理=>GitHub
+ [参考になったURLはここにナレッジためていこう](http://qiita.com/PallCreaker)

### 環境構築の仕方(local)
 node と bower が入ってない人は、
```
$brew install node 
$npm install -g bower
```

```
git clone git@github.com:RHDHR/r_apple.git
cp config/database.yml.sample config/database.yml
vim config/database.yml # 環境に合わせて修正
cp .env.sample .env 
vim .env #facebookのapi and secret_keyを編集
bundle install --path vendor/bundle
bundle exec rake bower:install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

### 開発環境（各自のローカル）
+ OS:各自のMacOS
+ Web server: WEBrick
+ DB: MySQL

### 本番環境
+ Platform: AWS
+ OS:(EC2)CentOS
+ DB:(RDS)MySQL
+ Webサーバ: Nginx+Unicorn

### 本番環境でのコマンド（後に自動化）
##production環境用
```
bundle exec rake db:create RAILS_ENV=production
bundle exec rake db:migrate:reset RAILS_ENV=production
bundle exec rake db:seed RAILS_ENV=production
ps -ef | grep unicorn | grep -v grep
(kill process_id #これは、unicornをstopさせる時)
sudo /etc/init.d/nginx start #Nginxを起動 stop, restart
bundle exec rake assets:precompile RAILS_ENV=production #プレコンパイルする 
bundle exec unicorn_rails -D -c config/unicorn.rb -E production #Unicorn起動
#rails sはしてはいけない。weblickが動いてしまいます。
```
