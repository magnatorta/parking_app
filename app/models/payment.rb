class Payment < ApplicationRecord
  belongs_to :ticket

  after_save :update_ticket_paid

  enum method: [:credit_card, :debit_card, :cash]
  validates :method, presence: true

  def update_ticket_paid
    ticket.update(paid: true, price: 0)
    ticket.save
  end
end
