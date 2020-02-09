class RemoveUpdatedatFromCourses < ActiveRecord::Migration[6.0]
  def change
  	remove_column :courses, :created_at, :datetime
  end
end
