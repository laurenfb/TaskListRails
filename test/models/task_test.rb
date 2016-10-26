require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test 'tasks belong to the correct users' do
    task = tasks(:adas_task)
    ada = users(:ada)
    assert_equal(ada.id, task.user_id)

    task = tasks(:babbages_task)
    babbage = users(:babbage)
    assert_equal(babbage.id, task.user_id)
  end

  test 'tasks without user_ids are not valid' do
    task = tasks(:adas_task)
    assert(task.valid?)
    task.user_id = nil
    assert_not(task.valid?)
  end

  test 'tasks belong to users' do
    task = tasks(:adas_task)
    assert_not_nil(task.user_id)
    task = tasks(:babbages_task)
    assert_not_nil(task.user_id)
  end

  test 'tasks without titles are not valid' do
    task = tasks(:babbages_task)
    assert(task.valid?)
    task.title = nil
    assert_not(task.valid?)
  end

  test 'tasks can be created without extraneous info' do
    task = Task.new(title: "pet kitty", user_id: 12)
    assert(task.valid?)
  end

  test 'tasks do not belong to the wrong user' do
    ada_tasks = Task.where(user_id: users(:ada).id)
    bab_task = tasks(:babbages_task)

    assert_not(ada_tasks.include?(bab_task))
  end

  test 'if you add a user_id to a task with no user_id it becomes valid' do
    task = Task.create(title: "laundry :(")
    assert_not(task.valid?)
    task.user_id = 100
    assert(task.valid?)
  end

  test 'check_complete should return whether task is complete' do
    task = tasks(:babbages_task)
    assert_not(task.complete)

    task = tasks(:adas_task)
    assert(task.complete)
  end

  test 'mark_complete should add a completed_at attr' do
    task = tasks(:babbages_task)
    assert_nil(task.completed_at)
    task.mark_complete(true)
    assert_not_nil(task.completed_at)
  end

  test 'mark_complete should mark an incomplete task as complete' do
    task = tasks(:babbages_task)
    assert_not(task.complete)
    task.mark_complete(true)
    assert(task.complete)
  end
end
