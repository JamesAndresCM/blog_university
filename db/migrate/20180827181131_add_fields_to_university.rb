class AddFieldsToUniversity < ActiveRecord::Migration[5.1]
  def change
    add_column :universities, :direccion, :string
    add_column :universities, :phone_number, :integer
  end
end
