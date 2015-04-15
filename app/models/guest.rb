class Guest < ActiveRecord::Base
    has_many :invoices, :dependent => :destroy
    
    validates :name, presence: true
    
    validates :days, presence: true
    validates :days, numericality: {greater_than: 0}
    
    validates :checkin, presence: true   
    
    belongs_to :room
end
