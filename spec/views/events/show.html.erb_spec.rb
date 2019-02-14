require 'rails_helper'

RSpec.describe "events/show", type: :view do

  before do
    @event = FactoryBot.create (:event)
    @events = assign(:events, [@event])
  end
  
  context 'when user is signed in' do
    before do
      allow(view).to receive(:current_user).and_return(admin)
    end

    it 'shows admin link' do
      render
      expect(rendered).to match /Mon espace/
    end
  end

  it "should show event title" do
    render
    expect(rendered).to include event.title
  end


  pending "should show event description"
  pending "should show number of attendants"
  pending "should show admin email"
  pending "should show start datetime"
  pending "should show end datetime"
  pending "should show location"
  pending "should show price"
  pending "should show button to checkin unless admin or already checked in"
  pending "should show button to view attendants if current_user is admin"

end
