class ChangeBooleanFormantInTesting < ActiveRecord::Migration
  def up
    change_column :testings, :test_passed_yn, :string
  end

  def down
    change_column :testings, :test_passed_yn, :boolean
  end
end
