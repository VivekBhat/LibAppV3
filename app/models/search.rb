class Search < ApplicationRecord
  def search_rooms
    rooms = Room.all
    rooms = rooms.where(["roomnumber = ?", roomnumber ]) if roomnumber.present?
    rooms = rooms.where(["building LIKE ?", building ]) if building.present?
    rooms = rooms.where(["status LIKE ?", status]) if status.present?
    rooms = rooms.where(["size LIKE ?", size]) if size.present?
    return rooms
  end
end
