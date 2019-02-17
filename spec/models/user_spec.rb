require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do 
    @user = FactoryBot.create (:user)
  end

  context "Factory" do

    it "is a valid factory" do
      # vérifie si la factory est valide
      expect(FactoryBot.build(:user)).to be_valid
    end

    it "create a valid object with valid attributes" do
      # vérifie si le user est bien valide
      expect(@user).to be_a(User)
    end
  end

  context "Validation" do
    # user shoulda-matchers
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:avatar) }
  end

  context "Model" do
    it "#full_name returns the full name" do
      expect("#{@user.first_name} #{@user.last_name}").to eq(@user.full_name)
    end

    # TODO put is here or in mailer rspec?
    it "sends welcome mail on sign up"

  end

end
