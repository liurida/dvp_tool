class Dvp < ActiveRecord::Base
  # select choices
  CHECK_TYPE = %w(OC_VALIDATION OC_DERIVATION OC_UNIVIRATE)
  CHECK_METHOD = %w(AUTO MANUAL)
  REVIEW_TYPE = %w(INV_REVIEW DM_REVIEW CRA_REVIEW)
  # make the model commentable
  acts_as_commentable

  belongs_to :study
  belongs_to :domain
  has_many :testings

  attr_accessible :check_method, :check_type, :description, :memo,
    :proc_name, :query_message, :review_type, :seq_num,
    :study_id, :domain_id, :program_status, :test_status

  def to_s
    "#{self.study}-#{self.seq_num}"
  end

#  def program_status
#    #return program status based on testing model
#    if self.testings.last.nil?
#      return 'N'
#    else
#      return 'Y'
#    end
#  end
#
#  def test_status
#    #return testing status based on testing model
#    if self.testings.last.nil? or self.testings.last.tested_at.nil?
#      return 'NOT TEST'
#    elsif self.testings.last.test_passed_yn == 'N'
#      return 'FAILURE'
#    elsif self.testings.last.test_passed_yn == 'Y'
#      return 'PASSED'
#    else
#      return 'NOT TEST'
#    end
#  end

end
