class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.integer :classcode
      t.string :classname
      t.float :credits
      t.string :schedule
      t.string :room_place
      t.string :instructor

      t.timestamps
    end
  end
end
