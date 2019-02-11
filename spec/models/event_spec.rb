RSpec.describe Event, type: :model do

  before(:each) do 
    @event = FactoryBot.create (:event)
  end

  context "Factory" do

    it "has a valid factory" do
      # vérifie si la factory est valide
      expect(FactoryBot.build(:event)).to be_valid
    end

    it "is valid with valid attributes" do
      # vérifie si le user est bien valide
      expect(@event).to be_a(Event)
    end
  end

  context "Validation" do

    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:location) }
    it { should validate_length_of(:title) }
    it { should validate_length_of(:description) }
    # it { should validate :price_is_in_accepted_range}
    end

end
