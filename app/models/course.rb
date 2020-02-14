
# License:
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2019-2020
# - Engelberg See

# Code History:
# Engelberg See - 02/05/20 - Generated Courses file, Associates foreign key

# File Creation Date: 02/05/20
# Development Group: Engelberg See
# Purpose: Associates the foreign key to another table


class Course < ApplicationRecord
	has_many :users, :through => :preferredsubjects
	has_many :preferredsubjects, :dependent => :destroy
end
