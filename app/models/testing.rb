class Testing < ActiveRecord::Base
  belongs_to :dvp
  belongs_to :requested_by, :class_name => "User", :foreign_key => 'requested_by_id'
  belongs_to :tested_by, :class_name => "User", :foreign_key => 'tested_by_id'
  attr_accessible :request_comment, :requested_at, :test_comment, :test_passed_yn, :tested_at,
                  :dvp_id, :requested_by_id, :tested_by_id
  after_save :update_dvp_program_status

  def update_dvp_program_status
    # update dvp columns based on last filled record
    input_data = {}
    if self.test_passed_yn
      input_data[:test_status] = self.test_passed_yn
      if self.test_passed_yn == 'N'
        input_data[:program_status] = 'N'
      end
    else
      input_data[:program_status] = 'Y'
      input_data[:test_status] = nil
    end
    p input_data
    @dvp = self.dvp
    @dvp.update_attributes(input_data)
    p @dvp
  end
end
