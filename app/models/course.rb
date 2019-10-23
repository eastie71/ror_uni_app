class Course < ApplicationRecord
	validates :code, presence: true, uniqueness: true, length: { minimum: 3, maximum: 12 }
	validates :name, presence: true, length: { minimum: 10, maximum: 60 }
	validates :description, presence: true, length: { minimum: 10, maximum: 300 }
	has_many :student_courses
end