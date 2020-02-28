# License:
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2019-2020
# - Engelberg See

# Code History:
# Engelberg See - 02/21/20 - Generated Preferenes file, edited to have choices, Associated foreign key to user
# Engelberg See - 02/22/20 - Added unique choices and limit for preferences

# File Creation Date: 02/21/20
# Development Group: Engelberg See
# Purpose: To allow functions and choices to go to active record

class Preference < ApplicationRecord
	PREF = ["Helpfulness", "Easiness", "Pedagogy"]
	belongs_to :user
	validate :validate_choices
	validate :preferences_within_limit, :on => :create

	#Routine Creation Date: 02/22/20
	#Purpose of the Routine: Validates if choices are unique
	#Required: Preferences Database
	#Return Value: Print statement when choices not unique
	def validate_choices
		unless (self.choice1 != self.choice2)  && (self.choice1 != self.choice3) && (self.choice2 != self.choice3)
			errors.add(:Choices, 'must have different answers for each')
		end
	end

	#Routine Creation Date: 02/22/20
	#Purpose of the Routine: Limits the amount of preferences a user can take
	#Error printing
	#Required: Preferences and User Database
	#Return Value: Print statement when exceeded limit
	def preferences_within_limit
	  	if self.user.preferences.reload.count >= 1
	      errors.add(:base, 'Exceeded preferences limit')
	    end
	end


end
