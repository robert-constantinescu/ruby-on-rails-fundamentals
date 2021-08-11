class AddTimestampsToReports < ActiveRecord::Migration[6.1]
  def change
    # add column require 3 arguments: :table_name, :column_name, :column_type
    add_column :reports, :created_at, :datetime, precision: 6, null: false
    add_column :reports, :updated_at, :datetime,precision: 6, null: false
  end
end
