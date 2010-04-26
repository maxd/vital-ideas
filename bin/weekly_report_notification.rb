#!/usr/bin/env ruby

#
# This script send weekly reports to subscribed users 
#
# Example of crontab configuration:
# 0 23 * * 7 RAILS_ENV=production <path to vital ideas root dir>/bin/weekly_report_notification.rb

require File.expand_path('../../config/environment', __FILE__)

now = DateTime.now

User.all(:conditions => { :send_weekly_report => true }).each do |user|
  ideas_on_this_week = user.ideas.all(:conditions => ["ideas.created_at BETWEEN ? AND ?", now.beginning_of_week, now.end_of_week])
  user_name = "#{user.last_name} #{user.first_name}"

  Notifier.deliver_weekly_report(user, ideas_on_this_week, user_name)
end