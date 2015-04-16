class Guest < ActiveRecord::Base
    has_many :invoices, :dependent => :destroy
    belongs_to :room
    
    validates_presence_of :name
    
    validates_presence_of :days
    validates_numericality_of :days, :greater_than_or_equal_to => 0
    
    def verify_checkout
        guests_array = Guest.all.map { |guest| [guest.name, guest.checkout] }
        guests_array.each do |guest|
            if guest.checkout == Date.today.in_time_zone
                room = Room.find(guest.room_id)
                room.available = true
                room.save
            end    
        end
    end
end