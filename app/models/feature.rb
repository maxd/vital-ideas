class Feature < ActiveRecord::Base

  belongs_to :idea

  validates_presence_of :title
  validates_presence_of :weight
  validates_inclusion_of :weight, :in => -1000..1000

  def to_param
    if new_record?
      super
    else
      "#{self.id}-#{self.title.parameterize}"
    end
  end

end
