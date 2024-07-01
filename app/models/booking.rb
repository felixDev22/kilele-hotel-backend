class Booking < ApplicationRecord
  belongs_to :user

  validates :date_of_arrival, :date_of_departure, :adults, :children, :room, presence: true
  validates :adults, :children, :room, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :departure_after_arrival

  private

  def departure_after_arrival
    return if date_of_arrival.blank? || date_of_departure.blank?

    errors.add(:date_of_departure, "must be after arrival date") if date_of_departure <= date_of_arrival
  end
end
