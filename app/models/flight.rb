class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  has_many :bookings
  has_many :passengers, through: :bookings

  accepts_nested_attributes_for :bookings, reject_if: :all_blank
end
