class CoursesController < ApplicationController
	def index
		@courses = Course.paginate(:page => params[:page], :per_page => 4)
		@custom_paginate_renderer = custom_paginate_renderer
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			flash[:success] = "Successfully created course: #{@course.name}"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@course = Course.find(params[:id])
	end

	def edit
		@course = Course.find(params[:id])
	end

	def update
		@course = Course.find(params[:id])
		if (@course.update(course_params))
			flash[:success] = "Successfully updated course: #{@course.name}"
			redirect_to course_path(@course)
		else
			render 'edit'
		end
	end

	private
		def course_params
			params.require(:course).permit(:code, :name, :description)
		end

end