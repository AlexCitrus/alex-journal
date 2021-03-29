require "application_system_test_case"

class DescriptionsTest < ApplicationSystemTestCase
  setup do
    @description = descriptions(:one)
  end

  test "visiting the index" do
    visit descriptions_url
    assert_selector "h1", text: "Descriptions"
  end

  test "creating a Description" do
    visit descriptions_url
    click_on "New Description"

    fill_in "Task", with: @description.task_id
    click_on "Create Description"

    assert_text "Description was successfully created"
    click_on "Back"
  end

  test "updating a Description" do
    visit descriptions_url
    click_on "Edit", match: :first

    fill_in "Task", with: @description.task_id
    click_on "Update Description"

    assert_text "Description was successfully updated"
    click_on "Back"
  end

  test "destroying a Description" do
    visit descriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Description was successfully destroyed"
  end
end
