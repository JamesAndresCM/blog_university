class AddUserToUniversity < ActiveRecord::Migration[5.1]
  def change
  	add_reference :users, :university, foreign_key: true, on_delete: :cascade
  end
end
