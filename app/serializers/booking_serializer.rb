class BookingSerializer < ActiveModel::Serializer
  attributes :id, :date_of_arrival, :date_of_departure, :adults, :children, :room, :total_price
  belongs_to :user
end