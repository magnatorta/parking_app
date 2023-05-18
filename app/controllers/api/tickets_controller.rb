class Api::TicketsController < ApplicationController
  #GET api/tickets
  def index
    render json: Ticket.all
  end

  #POST api/tickets
  def create
    ticket = Ticket.new(code: setCode)
    if ticket.save
      render json: ticket, only: [:id, :code, :created_at], status: :created
    else
      render json: ticket.errors, status: :unprocessable_entity
    end
  end

  # GET api/tickets/0000000000000001
  def show
    #set price
    render json: Ticket.find_by(code: params[:code])
  end

  private
  #hexadecimal code of the next id
  def setCode
    nextId = Ticket.last.nil? ? 1 : Ticket.last.id + 1
    ("%016x" % nextId).to_s
  end
end