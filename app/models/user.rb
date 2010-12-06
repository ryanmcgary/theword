class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone_number
  # relationships
  has_many :words
  has_many :recordings 
  
validates_presence_of :name, :on => :create, :message => "can't be blank"
validates_presence_of :phone_number, :on => :create, :message => "can't be blank"
validates_length_of :phone_number, :within => 10..10, :on => :create, :message => "must be 10 digits"
validates_format_of :phone_number, :with => /^[\d]+$/, :on => :create, :message => "must be digits only"            
end
