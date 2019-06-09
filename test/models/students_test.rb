require 'test_helper'

class StudentsTest < ActiveSupport::TestCase
  def setup
		@student1 = Student.first
		@student2 = Student.last
	end

	test "check fixture student is valid" do
		assert @student1.valid?
		assert @student2.valid?
	end

	test "check student email is unique" do
		@student1.email = @student2.email
		assert_not @student1.valid?
	end

	test "student authentication" do
		assert @student1.authenticate("betty")
		assert @student2.authenticate("wilma")
	end

	test "valid student email ok" do
		@student1.email = "abc.123@43ish.com.nz.co"
		assert @student1.valid?
	end

	test "invalid student email fails" do
		@student1.email = "John.Doe@example"
		assert_not @student1.valid?
	end

	test "short student name fails" do
		@student1.name = "a"
		assert_not @student1.valid?
	end

	test "valid student name OK" do
		@student1.name = "My Name is Good"
		assert @student1.valid?
	end
end
