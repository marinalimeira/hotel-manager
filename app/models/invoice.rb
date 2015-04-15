class Invoice < ActiveRecord::Base
    has_one :item, :dependent => :destroy
    belongs_to :guests
    
    validates :item_quantity, presence: true
    validates :item_quantity, numericality: {greater_than: 0}    
end
