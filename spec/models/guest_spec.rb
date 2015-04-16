require 'spec_helper'

describe Guest, :type => :model do
    
    it "should not allow create a guest with empty name" do
        expect(Guest.create(days: 3).errors.messages).to eq name: ["can't be blank"]
    end

    it "should belong to a Room" do
        
        guest = Guest.create
        expect(guest).to belong_to(:room)
    end
    
    it { is_expected.to have_many(:invoices) }
end