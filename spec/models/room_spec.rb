require 'spec_helper'

describe Room, :type => :model do

    it "should not allow create a room with empty number" do
        expect(Room.create.errors.messages).to eq number: ["can't be blank"]
    end
    
    it "validates the presence of its number" do
        room = Room.new(number: "")
         
        expect(room).to be_invalid
    end
    
    it {is_expected.to have_many(:guests)}
end