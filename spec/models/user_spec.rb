require 'rails_helper'

 RSpec.describe User, type: :model do
   it "can be created as an admin" do
     user = create(:user, role: 1)

     expect(user.role).to eq("admin")
     expect(user.admin?).to be_truthy
   end

   it "can be created as a default user" do
     user = create(:user)

     expect(user.role).to eq("default")
     expect(user.default?).to be_truthy
   end
 end

 #RSpec.describe User, type: :model do
  #describe "validations" do
    #it { is_expected.to validate_presence_of(:email) }
    #it { is_expected.to validate_presence_of(:password) }
    #it { is_expected.to validate_presence_of(:role) }
    #it { is_expected.to validate_presence_of(:address) }
    #it { is_expected.to validate_presence_of(:city) }
    #it { is_expected.to validate_presence_of(:state) }
    #it { is_expected.to validate_presence_of(:phone) }
    #it { is_expected.to validate_presence_of(:zipcode) }
    #it { is_expected.to validate_uniqueness_of(:email) }

  #end
  #describe "associations" do
    #it { is_expected.to have_many(:orders) }
  #end
 #end
