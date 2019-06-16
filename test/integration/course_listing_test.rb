require 'test_helper'

class CourseListingTest < ActionDispatch::IntegrationTest
  def setup
		@course1 = Course.first
		@course2 = Course.last
	end

	test "should get list of courses" do
		get root_path
		assert_match @course1.name, response.body
		assert_match @course1.code, response.body
		assert_match @course2.name, response.body
		assert_match @course2.code, response.body
	end
end
