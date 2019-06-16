require 'test_helper'

class StudentIndexTest < ActionDispatch::IntegrationTest
  def setup
		@student1 = Student.first
		@student2 = Student.last
	end

	test "should get list of students" do
		get students_path
		assert_template 'students/index'
		assert_match @student1.name, response.body
		assert_match @student1.email, response.body
		assert_match @student2.name, response.body
		assert_match @student2.email, response.body
	end
end
