require "application_system_test_case"

class PreferredsubjectsTest < ApplicationSystemTestCase
  setup do
    @preferredsubject = preferredsubjects(:one)
  end

  test "visiting the index" do
    visit preferredsubjects_url
    assert_selector "h1", text: "Preferredsubjects"
  end

  test "creating a Preferredsubject" do
    visit preferredsubjects_url
    click_on "New Preferredsubject"

    fill_in "Course", with: @preferredsubject.course_id
    fill_in "User", with: @preferredsubject.user_id
    click_on "Create Preferredsubject"

    assert_text "Preferredsubject was successfully created"
    click_on "Back"
  end

  test "updating a Preferredsubject" do
    visit preferredsubjects_url
    click_on "Edit", match: :first

    fill_in "Course", with: @preferredsubject.course_id
    fill_in "User", with: @preferredsubject.user_id
    click_on "Update Preferredsubject"

    assert_text "Preferredsubject was successfully updated"
    click_on "Back"
  end

  test "destroying a Preferredsubject" do
    visit preferredsubjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Preferredsubject was successfully destroyed"
  end
end
