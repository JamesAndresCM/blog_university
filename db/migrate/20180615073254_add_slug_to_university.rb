class AddSlugToUniversity < ActiveRecord::Migration[5.1]
  def change
    add_column :universities, :slug, :string
    add_index :universities, :slug, unique: true
  end
end
