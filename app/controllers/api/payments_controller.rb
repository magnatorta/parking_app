class Api::PaymentsController < ApplicationController
  
  # POST api/tickets/0000000000000001/payments
  # json body: {"method": "cash"}
  def create
    #TODO: Refactor this line:
    payment = Payment.new(method: params[:method], ticket_id: Ticket.find_by(code: params[:ticket_code]).id)
    if payment.save
      render json: payment, only: [:id, :method, :created_at], status: :created
    else
      render json: payment.errors, status: :unprocessable_entity
    end
  end
end
