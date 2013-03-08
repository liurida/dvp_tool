class CreateTestings < ActiveRecord::Migration
  def change
    create_table :testings do |t|
      t.references :dvp
      t.references :requested_by
      t.datetime :requested_at
      t.string :request_comment
      t.references :tested_by
      t.datetime :tested_at
      t.boolean :test_passed_yn
      t.string :test_comment

      t.timestamps
    end
    add_index :testings, :dvp_id
    add_index :testings, :requested_by_id
    add_index :testings, :tested_by_id
  end
end
