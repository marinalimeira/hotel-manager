class Item < ActiveRecord::Base
    validates :name, presence: true
    
    validates :price, presence: true
    validates :price, numericality: {greater_than: 0}   
    
    validates :quantity_in_stock, presence: true
    validates :quantity_in_stock, numericality: {greater_than: 0}
    
    belongs_to :invoices    
end
