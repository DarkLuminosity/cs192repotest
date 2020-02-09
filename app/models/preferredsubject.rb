class Preferredsubject < ApplicationRecord
  validates_uniqueness_of :course_id, :scope => [:user_id]
  belongs_to :user
  belongs_to :course

end
