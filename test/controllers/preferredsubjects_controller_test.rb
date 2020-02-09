require 'test_helper'

class PreferredsubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preferredsubject = preferredsubjects(:one)
  end

  test "should get index" do
    get preferredsubjects_url
    assert_response :success
  end

  test "should get new" do
    get new_preferredsubject_url
    assert_response :success
  end

  test "should create preferredsubject" do
    assert_difference('Preferredsubject.count') do
      post preferredsubjects_url, params: { preferredsubject: { course_id: @preferredsubject.course_id, user_id: @preferredsubject.user_id } }
    end

    assert_redirected_to preferredsubject_url(Preferredsubject.last)
  end

  test "should show preferredsubject" do
    get preferredsubject_url(@preferredsubject)
    assert_response :success
  end

  test "should get edit" do
    get edit_preferredsubject_url(@preferredsubject)
    assert_response :success
  end

  test "should update preferredsubject" do
    patch preferredsubject_url(@preferredsubject), params: { preferredsubject: { course_id: @preferredsubject.course_id, user_id: @preferredsubject.user_id } }
    assert_redirected_to preferredsubject_url(@preferredsubject)
  end

  test "should destroy preferredsubject" do
    assert_difference('Preferredsubject.count', -1) do
      delete preferredsubject_url(@preferredsubject)
    end

    assert_redirected_to preferredsubjects_url
  end
end
