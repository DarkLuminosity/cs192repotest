# License:
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2019-2020
# - Engelberg See

# Code History:
# Engelberg See - 02/08/20 - Associates foreign key
# Engelberg See - 02/14/20 - Added Subject Limit
# File Creation Date: 01/21/20
# Development Group: Engelberg See
# Purpose: Associates the foreign key to another table

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :courses, :through => :preferredsubjects
  has_many :preferredsubjects, :dependent => :destroy

  #Routine Creation Date: 02/14/20
  #Purpose of the Routine: Indicates the subject limit
  #Calling Arguments: None
  #Required: None
  #Return Value: 10
  def subject_limit
  	10
  end
  # attr_accessor :login
  # validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }
	# def self.find_first_by_auth_conditions(warden_conditions)
	# 	conditions = warden_conditions.dup
	# 	if login = conditions.delete(:login)
	# 		where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
	# 	else
	# 		where(conditions).first
	# 	end
		
	# end

end
