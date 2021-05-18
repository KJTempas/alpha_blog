require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
#these test run in a special test dbase; data deleted after each test is run
    def setup
        @category = Category.new(name: "Sports")
    end

    test "category should be valid" do
        assert @category.valid?
    end #any instance variables created in a test are scrubbed after the test

    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save #save instance variable to test dbase
        @category2 = Category.new(name: "Sports")
        assert_not @category2.valid?
    end

    test "name should not be too long" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "name should not be too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end
end