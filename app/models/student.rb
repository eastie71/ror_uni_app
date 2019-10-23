class Student < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 253 }, format: { with: VALID_EMAIL_REGEX }
	validates :name, presence: true, length: { minimum: 3, maximum: 100 }
	has_secure_password
	has_many :student_courses
end