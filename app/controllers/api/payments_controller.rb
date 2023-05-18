class Api::PaymentsController < ApplicationController
  
  # POST api/tickets/0000000000000001/payments
  # json body: {"method": 0}
  def create
    #TODO test method enums
    payment = Payment.new(method: params[:method], ticket_id: params[:ticket_code])
    if payment.save
      render json: payment, only: [:id, :method, :created_at], status: :created
    else
      render json: payment.errors, status: :unprocessable_entity
    end

    #TODO mark the ticket as paid
  end
end
