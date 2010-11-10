class Word < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user
  has_many :recordings

  validates :title, :presence => true, :length => { :maximum => 90 }
  validates :user_id, :presence => true 
  
  default_scope :order => 'words.created_at DESC' 
end
