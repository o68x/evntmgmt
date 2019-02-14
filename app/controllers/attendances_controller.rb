class AttendancesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new
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
    # @attendance = Attendance.save(attendance_params)
    a = Attendance.new(stripe_customer_id: customer.id, event_id: @event.id, user_id: current_user.id)

		if a.save
			redirect_to event_path(@event.id)
		else
			render new_event_charge_path(@event.id)
    end
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
