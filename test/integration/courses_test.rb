require 'test_helper'

class CoursesIntegrationTest < ActionDispatch::IntegrationTest
  def setup
	@newCourse = Course.create!(code: "ABC123", name: "TEST COURSE", description: "TEST DESCRIPTION")
  end

  test "should create new valid course" do
    get new_course_path
    assert_template 'courses/new'
    new_code = "COURSE CODE"
		new_name = "COURSE NAME"
		new_description = "COURSE DESCRIPTION"
		# Check if count increases after posting new valid course
		assert_difference 'Course.count' do
			post courses_path, params: { course: {code: new_code, name: new_name, description: new_description}}
		end
		# Should display a flash success message
		assert_not flash.empty?
		follow_redirect!
		assert_template root_path
  end

  test "should reject creating an invalid course" do
		get new_course_path
		assert_template 'courses/new'
		new_code = "CODE OK"
		new_name = "COURSE NAME OK"
		bad_description = ""
		# Check if count stays same after posting new invalid course
		assert_no_difference 'Course.count' do
			post courses_path, params: { course: {code: new_code, name: new_name, description: bad_description}}
		end
		assert_template 'courses/new'
		assert_select 'h5', :text => /error/
  end
  
  test "should reject duplicate course codes" do
		@course1 = Course.first
		get new_course_path
		assert_template 'courses/new'
		new_name = "MY COURSE"
		new_code = @course1.code
		new_description = "MY DESCRIPTION"
		# Check if count stays same after posting new invalid course
    	assert_no_difference 'Course.count' do
      		post courses_path, params: { course: {code: new_code, name: new_name, description: new_description}}
		end
		assert_template 'courses/new'
		assert_select 'h5', :text => /error/
	end

	test "should show a course" do
		get course_path(@newCourse)
		assert_response :success
		assert_template 'courses/show'
		assert_match @newCourse.code, response.body
		assert_match @newCourse.name, response.body
		assert_match @newCourse.description, response.body
		assert_select "a[href=?]", edit_course_path(@newCourse)
	end
end
