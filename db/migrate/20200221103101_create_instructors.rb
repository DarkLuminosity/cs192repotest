class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.string :name
      t.float :helpfulness
      t.float :easiness
      t.float :pedagogy
      t.float :overall

      t.timestamps
    end
  end
end
