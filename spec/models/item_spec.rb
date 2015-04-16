require 'spec_helper'

describe Item, :type => :model do

    it "should not allow create an item with empty name" do
        item = Item.new(price: 2, quantity_in_stock: 2)
        expect(item.errors.messages).to eq name: ["can't be blank"]
    end
    
    it "validates the presence of its name" do
        item = Item.new(price: 2, quantity_in_stock: 2)
         
        expect(item).to be_invalid
    end
    
    it "validates the presence of its price" do
        item = Item.new(name: "Chocolate", quantity_in_stock: 2)
        expect(item.errors.messages).to eq price: ["can't be blank"]
         
        expect(item).to be_invalid
    end
    
    it "validates the quantity of its price" do
        item = Item.new(name: "Chocolate", quantity_in_stock: 2, price: -1)
         
        expect(item.errors.messages).to eq price: ["must be greater than 0"]
    end
        
    it "validates the presence of its quantity in stock" do
        item = Item.new(name: "Agua", price: 2)
        expect(item.errors.messages).to eq quantity_in_stock: ["can't be blank"]
         
        expect(item).to be_invalid
    end
    
    it "validates the quantity of its quantity in stock" do
        item = Item.new(name: "Agua", price: 2, quantity_in_stock: -3)
         
        expect(item.errors.messages).to eq quantity_in_stock: ["must be greater than 0"]
    end
end