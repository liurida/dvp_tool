class Domain < ActiveRecord::Base
  attr_accessible :desc, :name
  has_many :edit_check_infos

  def to_s
    self.name
  end
end
