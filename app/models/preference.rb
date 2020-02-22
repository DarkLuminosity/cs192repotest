class Preference < ApplicationRecord
	PREF = ["Helpfulness", "Easiness", "Pedagogy"]
	belongs_to :user
	validate :validate_choices
	validate :preferences_within_limit, :on => :create

	def validate_choices
		unless (self.choice1 != self.choice2)  && (self.choice1 != self.choice3) && (self.choice2 != self.choice3)
			errors.add(:Choices, 'must have different answers for each')
		end
	end

	def preferences_within_limit
	  	if self.user.preferences.reload.count >= 1
	      errors.add(:base, 'Exceeded preferences limit')
	    end
	end


end
