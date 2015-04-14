class Room < ActiveRecord::Base
    validates :number, presence: true
end
