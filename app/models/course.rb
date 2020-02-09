class Course < ApplicationRecord
	has_many :users, :through => :preferredsubjects
	has_many :preferredsubjects, :dependent => :destroy
end
