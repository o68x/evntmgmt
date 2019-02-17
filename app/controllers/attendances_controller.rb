class AttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
  end

  def create
    # TODO only one attendance possible
    # and not attend your own event
    # create a stripe payment
    @event = Event.find(params[:event_id])
    @amount = @event.price * 100
    @attendance = Attendance.new
    @attendance.user = current_user
    @attendance.event = @event

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @amount,
      description:  'Rails Stripe customer',
      currency:     'usd'
    )
    
    @attendance.stripe_customer_id = customer.id
    
    if @attendance.save
			redirect_to event_path(@event.id)
		else
			render new_event_charge_path(@event.id)
    end
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
