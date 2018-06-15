class AddColumnToReview < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :course_id, :integer
    add_column :reviews, :major_id, :integer
  end
end
