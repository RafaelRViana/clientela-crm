class AddUniqueIndexToAccountsDomain < ActiveRecord::Migration
  def self.up
    add_index :accounts, :domain, :unique => true
  end

  def self.down
    remove_index :accounts, :domain
  end
end
