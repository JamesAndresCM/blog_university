class AddImageToUniversity < ActiveRecord::Migration[5.1]
  def change
  	add_column :universities, :image, :string 
  end
end
