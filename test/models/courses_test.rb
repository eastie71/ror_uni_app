require 'test_helper'

class CoursesTest < ActiveSupport::TestCase
	def setup
		@course1 = Course.first
		@course2 = Course.last
	end

	test "check fixture is valid" do
		assert @course1.valid?
	end

	test "check uniqueness check works ok" do
		@course1.code = @course2.code
		assert_not @course1.valid?
	end

	test "check short code is invalid" do
		@course1.code = "a"
		assert_not @course1.valid?
	end

	test "check valid code ok" do
		@course1.code = "MY_CODE"
		assert @course1.valid?
	end

	test "check invalid name" do
		@course1.name = ""
		assert_not @course1.valid?
	end

	test "check valid name ok" do
		@course2.name = "NEW COURSE NAME OK"
		assert @course2.valid?
	end

	test "check invalid description" do
		@course1.description = ""
		assert_not @course1.valid?
	end

	test "check valid description ok" do
		@course2.description = "NEW COURSE DESCRIPTION OK"
		assert @course2.valid?
	end
end
