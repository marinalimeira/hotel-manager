class Invoice < ActiveRecord::Base
    has_one :item, :dependent => :destroy
    belongs_to :guests
    
    validates_presence_of :item_quantity
    validates_numericality_of :item_quantity, :greater_than_or_equal_to => 1  
end
