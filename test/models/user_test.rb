require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test 'users can have tasks' do
    assert_not_empty(Task.where(user_id: users(:ada)))
    assert_not_empty(Task.where(user_id: users(:babbage)))
  end

  test 'users do not have to have tasks to be valid' do
    user = User.create(name: "cat", uid: 13354, provider: 'github', email: 'ada@ada.org')

    assert(user.valid?)
  end

  test 'users have the correct tasks' do
    assert(users(:ada).tasks.include?(tasks(:adas_task)))
    assert(users(:babbage).tasks.include?(tasks(:babbages_task)))
  end

  test 'users do not have others\' tasks' do
    assert_not(users(:ada).tasks.include?(tasks(:babbages_task)))
    assert_not(users(:babbage).tasks.include?(tasks(:adas_task)))
  end

  test 'new users have no tasks yet' do
    user = User.create(name: "cat", uid: 13354, provider: 'github', email: 'ada@ada.org')

    assert_empty(Task.where(user_id: user.id))
  end

  test 'if you add a task to a user with no tasks, it will assign to the user' do
    user = User.create(name: "cat", uid: 13354, provider: 'github', email: 'ada@ada.org')

    task = Task.create(title: "blah blah", description: "hi", complete: true, user_id: user.id)

    assert_not_empty(Task.where(user_id: user.id))
    assert(Task.where(user_id: user.id).include?(task))
  end

  test 'users must have uid' do

  end

  test 'users must have provider' do

  end

  test 'users must have email' do

  end

  test 'build_from_github creates a user' do

  end
end
