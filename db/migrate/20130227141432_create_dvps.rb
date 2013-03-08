class CreateDvps < ActiveRecord::Migration
  def change
    create_table :dvps do |t|
      t.references :study
      t.references :domain
      t.string :seq_num
      t.string :description
      t.string :check_method
      t.string :check_type
      t.string :review_type
      t.string :query_message
      t.string :memo
      t.string :proc_name

      t.timestamps
    end
    add_index :dvps, :study_id
    add_index :dvps, :domain_id
  end
end
