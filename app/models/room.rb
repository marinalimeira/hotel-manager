class Room < ActiveRecord::Base
    validates_presence_of :number
    
    has_many :guests, dependent: :destroy
end
