require 'spec_helper'

describe Guest, :type => :model do
    
    it "should not allow create attendee with empty name" do
        expect(Attendee.create.errors.messages).to eq name: ["can't be blank"]
    end

    it 'should belong to a Room' do
        guest = User.new
        expect(guest).to belong_to(:room)
    end
    
    it { is_expected.to have_many(:invoices) }
end