class RemoveCreatedatFromCourses < ActiveRecord::Migration[6.0]
  def change
  	remove_column :courses, :updated_at, :datetime
  end
end
