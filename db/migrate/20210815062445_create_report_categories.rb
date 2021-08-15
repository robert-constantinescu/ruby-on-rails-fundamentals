class CreateReportCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :report_categories do |t|
      t.integer :report_id
      t.integer :category_id

    end
  end
end
