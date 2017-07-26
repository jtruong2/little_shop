require 'rails_helper'

RSpec.describe "User sees one category page"  do
  it "A user sees all items on the category show page" do
   category = create(:category)

   item1 = create(:item)
   item2 = create(:item, category_id: category.id)
   item3 = create(:item, category_id: category.id)

   visit category_path(category)

   expect(current_path).to eq("/categories/#{category.name}")

   expect(page).to have_content(item2.title)
   expect(page).to have_content(item3.title)
   expect(page).to_not have_content(item1.title)
  end
end
