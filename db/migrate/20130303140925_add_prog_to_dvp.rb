class AddProgToDvp < ActiveRecord::Migration
  def change
    add_column :dvps, :program_status, :string
    add_column :dvps, :test_status, :string
  end
end
