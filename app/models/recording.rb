class Recording < ActiveRecord::Base
  attr_accessible :audio_file, :word_id, :alias, :call_id, :short_text, :callcompleted
  
  belongs_to :user
  belongs_to :word 
  
  validates_presence_of :short_text, :on => :create, :message => "can't be blank"
  validates_length_of :short_text, :within => 3..140, :on => :create, :message => "must be present"

end
