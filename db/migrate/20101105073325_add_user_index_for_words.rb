class AddUserIndexForWords < ActiveRecord::Migration
  def self.up  
    add_column :words, :user_id, :integer
  end

  def self.down
    remove_column :words, :user_id
  end
end
