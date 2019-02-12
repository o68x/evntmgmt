require 'rails_helper'

RSpec.describe EventsController, type: :controller do

  context "#index" do

    pending "should populate @index variable"

  end

  context "#show" do

    pending "should return valid @event"

    pending "should send to show page"
  end


  context "#new" do

    pending "should send to new page for current user"
    pending "should not send to new page if not authentified"
    pending "should be associated to current_user"

  end

  context "#create" do

    pending "should not create if not authentified"
    pending "should redirect to #show page if save"
    pending "should render #new if rollback"

  end

end
