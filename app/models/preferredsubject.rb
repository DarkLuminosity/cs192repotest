# License:
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2019-2020
# - Engelberg See

# Code History:
# Engelberg See - 02/08/20 - Generated Preferred Subjects file, Associates foreign key
# Engelberg See - 02/14/20 - Fix bugs
# File Creation Date: 02/05/20
# Development Group: Engelberg See
# Purpose: Associates the foreign key to another table

class Preferredsubject < ApplicationRecord
  # before_create Preferredsubject.first.destroy if Preferredsubject.count > 8
  validates_uniqueness_of :course_id, :scope => [:user_id]
  belongs_to :user
  belongs_to :course

  delegate :users, to: :courses
  validate :preferred_subject_within_limit, on: :create

  #Routine Creation Date: 02/14/20
  #Purpose of the Routine: Limits the amount of preferred subjects a user can take
  #Error printing
  #Required: Preferred Subjects Database and User Database
  #Return Value: Print statement when exceeded limit
  def preferred_subject_within_limit
  	if self.user.preferredsubjects.reload.count >= self.user.subject_limit
      errors.add(:base, 'Exceeded preferred subjects limit')
    end
  end

end
