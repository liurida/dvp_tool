class Study < ActiveRecord::Base
  attr_accessible :study_code
  has_many :dvps

  def to_s
    self.study_code
  end
end
