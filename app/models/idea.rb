class Idea < ActiveRecord::Base

  acts_as_authorization_object

  acts_as_taggable_on :tags

  attr_protected :user, :user_id

  has_many :features, :order => "weight DESC"
  belongs_to :user
  belongs_to :state

  validates_presence_of :title
  validates_presence_of :intention
  validates_presence_of :state

  validates_length_of :intention, :maximum => 1024

  named_scope :published, :conditions => { :public => true }

  named_scope :for_user, lambda { |user| { :conditions => { :user_id => user } } } do

    def sticked_ideas
      all(:limit => 5, :conditions => { :sticky => true }, :order => "updated_at DESC")
    end

    def last_ideas
      all(:limit => 5, :order => "created_at DESC")
    end

    def last_changed_ideas
      all(:limit => 5, :order => "updated_at DESC")
    end

  end

  def self.published_ideas(limit = 5)
    all(:limit => limit, :conditions => { :public => true }, :order => "updated_at DESC")
  end

  def to_param
    if new_record?
      super
    else
      "#{self.id}-#{self.title.parameterize}"
    end
  end
  
end
