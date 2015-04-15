class Guest < ActiveRecord::Base
    belongs_to :room
    has_many :invoices :dependent => :destroy
end
