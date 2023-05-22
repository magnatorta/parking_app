class Api::FreeSpacesController < ApplicationController
  TOTAL_SPACES = 13

  #GET api/free-spaces
  def index
    free_spaces = TOTAL_SPACES - Ticket.count
    message = free_spaces <= 0 ? "Park full" : "There are "+free_spaces.to_s+ " spaces left"
    render json: {message: message}, status: :ok
  end
end