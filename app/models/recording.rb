class Recording < ActiveRecord::Base
  attr_accessible :audio_file, :word_id, :alias, :call_id, :short_text
  
  belongs_to :user
  belongs_to :word
end
