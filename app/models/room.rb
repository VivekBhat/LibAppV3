class Room < ApplicationRecord
  has_and_belongs_to_many :booking_histroys, dependent: :destroy
  enum status: {:Available => "available", :Booked => "booked"}
  enum building: { :Hunt => "James B. Hunt", :Hill => "D.H. Hill"}
  enum size: {:small => "4", :medium => "6", :large => "8"}

  validates_uniqueness_of :roomnumber
  validates_numericality_of :roomnumber, :only_integer => true

  def self.search(search)
    if search
      where(["building LIKE ?", "%#{search}%"])
    else
      all
    end
  end

end
