require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = "jordansaxe"
  	user.email = "jordansaxe15@gmail.com"
  	user.first_name = "Jordan"
  	user.last_name = "Saxe"
  	user.password = "password"
  	user.password_confirmation = "password"
  	assert !user.save
  	puts user.errors.inspect
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
  	user = User.new
  	user.profile_name = "My Profile with spaces"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert !user.errors[:profile_name].include?("must be formatted correctly")
  end
end
