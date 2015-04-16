require 'spec_helper'

describe Guest, :type => :model do
    
    it "should not allow create a guest with empty name" do
        guest = 
        expect(Guest.create(days: 3).errors.messages).to eq name: ["can't be blank"]
    end

    it "should belong to a Room" do
        
        guest = Guest.new
        expect(guest).to belong_to(:room)
    end
    
    it { is_expected.to have_many(:invoices) }
end