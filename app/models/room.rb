class Room < ActiveRecord::Base
    validates :number, presence: true
    
    has_many :guests, dependent: :destroy
end
