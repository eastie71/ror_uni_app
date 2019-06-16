require 'test_helper'

class StudentsTest2 < ActionDispatch::IntegrationTest
	def setup
	end

	test "should create new valid user" do
		get new_student_path
		assert_template 'students/new'
		new_name = "harry"
		new_email = "hpotter@hogwarts.co.uk"
		new_password = "ginny"
		# Check if count increases after posting new valid user
		assert_difference 'Student.count' do
			post students_path, params: { student: {name: new_name, email: new_email, password: new_password}}
		end
		# Should display a flash success message
		assert_not flash.empty?
		follow_redirect!
		assert_template root_path
	end

	test "should reject creating an invalid user" do
		get new_student_path
		assert_template 'students/new'
		new_name = "harry"
		new_email = "hpotter@hogwarts.co.uk"
		new_password = ""
		# Check if count stays same after posting new valid user
		assert_no_difference 'Student.count' do
			post students_path, params: { student: {name: new_name, email: new_email, password: new_password}}
		end
		assert_template 'students/new'
		assert_select 'h5', :text => /error/
	end

	test "should reject duplicate emails" do
		@student1 = Student.first
		get new_student_path
		assert_template 'students/new'
		new_name = "harry"
		new_email = @student1.email
		new_password = "ginny"
		# Check if count stays same after posting new valid user
		assert_no_difference 'Student.count' do
			post students_path, params: { student: {name: new_name, email: new_email, password: new_password}}
		end
		assert_template 'students/new'
		assert_select 'h5', :text => /error/
	end
end
