class AddAliasAndTextToRecordings < ActiveRecord::Migration
  def self.up
    add_column :recordings, :alias, :string
    add_column :recordings, :short_text, :string
  end

  def self.down
    remove_column :recordings, :short_text
    remove_column :recordings, :alias
  end
end
