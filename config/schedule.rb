# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
set :environment, :development
# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"

every 1.day, at: '9:55 pm' do
  runner 'Tasks::Passportcheck.no_updated_schedule_check'
end

every 60.minute do
  command "echo 'mossmossmossmossmossmoss'"
end
