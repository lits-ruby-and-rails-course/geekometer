class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :questions, :created_by_id, :user_id
  end
end
