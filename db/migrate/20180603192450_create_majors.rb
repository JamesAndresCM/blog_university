class CreateMajors < ActiveRecord::Migration[5.1]
  def change
    create_table :majors do |t|
      t.string :nombre
      t.references :university, foreign_key: true
      t.timestamps
    end
  end
end
