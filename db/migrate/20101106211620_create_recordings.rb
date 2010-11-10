class CreateRecordings < ActiveRecord::Migration
  def self.up
    create_table :recordings do |t|
      t.integer :word_id
      t.integer :user_id
      t.string :audio_file
      t.string :call_id

      t.timestamps
    end
  add_index :recordings, :user_id
  add_index :recordings, :word_id   
  end

  def self.down
    drop_table :recordings
  end
end
