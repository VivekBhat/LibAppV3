class BookingHistroy < ApplicationRecord
  has_and_belongs_to_many :rooms
end
