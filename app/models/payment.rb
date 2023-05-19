class Payment < ApplicationRecord
  belongs_to :ticket

  after_save :update_ticket_paid

  def update_ticket_paid
    ticket.update(paid: true)
    ticket.save
  end
end
