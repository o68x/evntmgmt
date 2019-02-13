class AttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    # create a stripe payment
    @event = Event.find(params[:event_id])
    @amount = @event.price * 100

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

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
