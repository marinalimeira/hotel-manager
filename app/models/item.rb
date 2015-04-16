class Item < ActiveRecord::Base
    validates_presence_of :name
    
    validates_presence_of :price
    validates_numericality_of :price, :greater_than_or_equal_to => 1
    
    validates_presence_of :quantity_in_stock
    validates_numericality_of :quantity_in_stock, :greater_than_or_equal_to => 1
    
    belongs_to :invoices    
end
