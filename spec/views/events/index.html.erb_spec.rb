require 'rails_helper'

RSpec.describe "events/index", type: :view do

  before(:each) do
    # @events = FactoryBot.build_list(:event, 5)
  end

  # FIXME (@LUCIEN) Link ok but test fucking fails! And why does it test the whole shit when I just want to check the navbar?
  it "renders the _navbar partial" do
    render
    expect(response).to render_template(partial: 'navbar')
  end

  describe "#navbar" do

    context "when user is autenticated" do

      pending "should have a button to CREATE_EVENT"
      pending "should show the CURRENT_USER not the LOG_IN dropdown button"

    end

    context "when user is not authenticated" do

      pending "should hide the button to CREATE_EVENT"
      pending "should show the LOG_IN dropdown button"

    end

    describe "#main" do

      pending "should render NAVBAR partial"
      pending "should render FOOTER partial"

      pending "should render grid of events"
      pending "should have links in grid to #show events"

    end

  end

end
