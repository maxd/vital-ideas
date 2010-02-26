class State < ActiveRecord::Base

  has_many :idea

  validates_presence_of :title
  
end
