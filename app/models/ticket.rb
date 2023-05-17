class Ticket < ApplicationRecord
	validates :code, presence: true, uniqueness: true
end
