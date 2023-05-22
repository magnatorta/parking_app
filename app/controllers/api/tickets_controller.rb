class Api::TicketsController < ApplicationController
  HOURLY_RATE = 2
  MIN_RATE = 2

  before_action :set_ticket, only: %i[show]

  #GET api/tickets
  def index
    render json: Ticket.all
  end

  #POST api/tickets
  def create
    ticket = Ticket.new(code: set_code)
    if ticket.save
      render json: ticket, only: [:id, :code, :created_at], status: :created
    else
      render json: ticket.errors, status: :unprocessable_entity
    end
  end

  # GET api/tickets/0000000000000001
  def show
    if @ticket.nil?
      render status: :not_found
    else
      set_price
      render json: @ticket , only: [:id, :code, :created_at, :price], status: :ok
    end
  end

   #GET api/tickets/0000000000000001/state
  def state
    ticket = Ticket.find_by(code: params[:ticket_code])

    if ticket.nil?
      render status: :not_found
    else
      unless ticket.paid && (ticket.updated_at >= 15.minutes.ago)
        ticket.update(paid: false)
      end
      render json: ticket, only: :paid, status: :ok
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find_by(code: params[:code])
  end

  #hexadecimal code of the next id
  def set_code
    next_id = Ticket.last.nil? ? 1 : Ticket.last.id + 1
    ("%016x" % next_id).to_s
  end

  #calculate ticket price
  def set_price
    total_hours = (Time.zone.now - @ticket.created_at)/3600
    total_price = total_hours.to_i == 0 ? MIN_RATE : total_hours.to_i * HOURLY_RATE
    @ticket.update(price: total_price)
  end
end