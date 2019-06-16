class StudentsController < ApplicationController
	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			flash[:success] = "Welcome to My University, #{@student.name}"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def index
		@students = Student.paginate(:page => params[:page], :per_page => 6)
		@custom_paginate_renderer = custom_paginate_renderer
	end

	def update
	end

	def show
	end

	private
		def student_params
			params.require(:student).permit(:name, :email, :password)
		end
end