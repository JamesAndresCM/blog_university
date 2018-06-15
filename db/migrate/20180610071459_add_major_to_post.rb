class AddMajorToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :major, foreign_key: true, on_delete: :cascade
  end
end
