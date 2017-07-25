require 'rails_helper'

RSpec.describe "User sees all items"  do
  it "A user sees all items on show page" do
   item1 = create(:item)
   item2 = create(:item)
   item3 = create(:item)

   visit items_path

   expect(current_path).to eq('/menu')

   expect(page).to have_content(item1.title)
   expect(page).to have_content(item2.title)
   expect(page).to have_content(item3.title)
  end
end
