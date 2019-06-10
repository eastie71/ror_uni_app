class StudentsController < ApplicationController
	def new
		@student = Student.new
	end

	def create
	end

	def index
		@students = Student.all
	end

	def update
	end

	def show
	end
end