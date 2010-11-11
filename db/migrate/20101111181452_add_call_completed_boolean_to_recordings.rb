class AddCallCompletedBooleanToRecordings < ActiveRecord::Migration
  def self.up
    add_column :recordings, :callcompleted, :boolean
  end

  def self.down
    remove_column :recordings, :callcompleted
  end
end
