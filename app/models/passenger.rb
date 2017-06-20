class Passenger < ApplicationRecord
  belongs_to :booking, inverse_of: :passengers
  belongs_to :flight
end
