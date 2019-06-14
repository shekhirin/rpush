class Rpush412Updates < ActiveRecord::VERSION::MAJOR >= 5 ? ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"] : ActiveRecord::Migration
  def self.up
    add_column :rpush_notifications, :expire_at, :timestamp, null: true
  end

  def self.down
    remove_column :rpush_notifications, :expire_at
  end
end
