class Room < ActiveRecord::Base
  belongs_to :room_type
  has_many :bookings

  validates :number, uniqueness: true

  def self.available_rooms(room_type_id, check_in, check_out)  	
  	Room.where("room_type_id = ? AND id not in (SELECT bookings.room_id FROM bookings WHERE bookings.room_type_id = ? AND bookings.check_in = ? AND bookings.check_out = ?)", room_type_id, room_type_id, check_in, check_out)
  end
end
