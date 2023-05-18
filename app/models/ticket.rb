class Ticket < ApplicationRecord

	#validating presence
	validates :code, presence: true, uniqueness: true

	#validating numericality
	validates :price, numericality: {greater_than_or_equal_to: 0}, :allow_nil => true
end
