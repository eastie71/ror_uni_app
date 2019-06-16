class ApplicationController < ActionController::Base
	def custom_paginate_renderer
	  # Return nice pagination for materialize
	  Class.new(WillPaginate::ActionView::LinkRenderer) do
		  def container_attributes
		    {class: "pagination"}
		  end

		  def page_number(page)
		    if page == current_page
		      "<li class=\"blue lighten-2 active\">"+link(page, page, rel: rel_value(page))+"</li>"
		    else
		      "<li class=\"waves-effect\">"+link(page, page, rel: rel_value(page))+"</li>"
		    end
		  end

		  def previous_page
		    num = @collection.current_page > 1 && @collection.current_page - 1
		    previous_or_next_page(num, "<i class=\"small material-icons\">arrow_back</i>")
		  end

		  def next_page
		    num = @collection.current_page < total_pages && @collection.current_page + 1
		    previous_or_next_page(num, "<i class=\"small material-icons\">arrow_forward</i>")
		  end

		  def previous_or_next_page(page, text)
		    if page
		      "<li class=\"waves-effect\">"+link(text, page)+"</li>"
		    else
		      "<li class=\"disabled\">"+link(text, "#!")+"</li>"
		    end
		  end
	  end
	end
end
