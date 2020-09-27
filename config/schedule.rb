# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
require File.expand_path(File.dirname(__FILE__) + "/environment")
set :environment, "development"
set :output, { :error => "log/cron_error.log" }
#set :path, "appへのpath"

every 1.day, at: '11:50 pm' do
  runner ""
end
