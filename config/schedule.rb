# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
set :environment, Rails.env
set :output, {:error => 'log/cron.log', :standard => 'log/cron.log'}
#every :day, :at => '0:00am' do
every :day, :at => '10:20am' do
  runner "lib/tasks/daily_judge.rb"
end
#every :monday, :at => '0:00am' do
every :day, :at => '10:20am' do
  runner "lib/tasks/weekly_judge.rb"
end
