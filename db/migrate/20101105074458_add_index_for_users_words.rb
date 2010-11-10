class AddIndexForUsersWords < ActiveRecord::Migration
  def self.up    
    add_index :words, :user_id
  end

  def self.down
    remove_index :words, :user_id
  end
end
