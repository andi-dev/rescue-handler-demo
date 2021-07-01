require "application_system_test_case"

class PeasTest < ApplicationSystemTestCase
  setup do
    @pea = peas(:one)
  end

  test "visiting the index" do
    visit peas_url
    assert_selector "h1", text: "Peas"
  end

  test "creating a Pea" do
    visit peas_url
    click_on "New Pea"

    click_on "Create Pea"

    assert_text "Pea was successfully created"
    click_on "Back"
  end

  test "updating a Pea" do
    visit peas_url
    click_on "Edit", match: :first

    click_on "Update Pea"

    assert_text "Pea was successfully updated"
    click_on "Back"
  end

  test "destroying a Pea" do
    visit peas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pea was successfully destroyed"
  end
end
