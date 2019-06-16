class CoursesController < ApplicationController
	def index
		@courses = Course.paginate(:page => params[:page], :per_page => 4)
		@custom_paginate_renderer = custom_paginate_renderer
	end

	def new
	end
end