class WeeklyReport < ActiveRecord::Migration
  def self.up
    add_column :users, :send_weekly_report, :boolean, :default => false
  end

  def self.down
    remove_column :user, :send_weekly_report 
  end
end
