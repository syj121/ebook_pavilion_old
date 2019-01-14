require "application_system_test_case"

class BookCategoriesTest < ApplicationSystemTestCase
  setup do
    @book_category = book_categories(:one)
  end

  test "visiting the index" do
    visit book_categories_url
    assert_selector "h1", text: "Book Categories"
  end

  test "creating a Book category" do
    visit book_categories_url
    click_on "New Book Category"

    fill_in "Name", with: @book_category.name
    click_on "Create Book category"

    assert_text "Book category was successfully created"
    click_on "Back"
  end

  test "updating a Book category" do
    visit book_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @book_category.name
    click_on "Update Book category"

    assert_text "Book category was successfully updated"
    click_on "Back"
  end

  test "destroying a Book category" do
    visit book_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book category was successfully destroyed"
  end
end
