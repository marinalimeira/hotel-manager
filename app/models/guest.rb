class Guest < ActiveRecord::Base
    has_many :invoices, :dependent => :destroy
    belongs_to :room
    
    validates_presence_of :name
    
    validates_presence_of :days
    validates_numericality_of :days, :greater_than_or_equal_to => 0
    
    validates_presence_of :checkin
end