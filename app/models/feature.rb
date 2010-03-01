class Feature < ActiveRecord::Base

  belongs_to :idea

  def to_param
    if new_record?
      super
    else
      "#{self.id}-#{self.title.parameterize}"
    end
  end

end
