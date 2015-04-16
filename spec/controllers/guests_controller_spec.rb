require 'spec_helper'
require 'date'

describe GuestsController, :type => :controller do
	describe "GET #new" do
		it "responds successfully with an HTTP 200 status code" do
			get :new
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the index template" do
			get :new
			expect(response).to render_template("new")
		end
	end

	
	describe "POST #create" do
#		it "should assign created guest" do
#			g = Guest.create(name: "Carla Freitas", days: 3, room_id: 1)
#			expect(g).to eq Guest.first
#		end
#
#		it "should redirect to guests/:id" do
#            post :create, guest:{name: "Fabiano Rocha", days: 3, room_id: 1}
#            guest = Guest.first
#			expect(response).to redirect_to "/guests/#{guest.id}"
#		end
#			
		it "should sum the checkin date with the qnt of days" do
                guest = Guest.create
				guest.checkin = Date.today.in_time_zone
				guest.days = 3
				guest.checkout = guest.checkin + guest.days.days
        
                expect(guest.checkout).to eq(Date.today.in_time_zone + guest.days.days)
        end
	end

	describe "GET #show" do
		before(:each) { Guest.create(name: "Danilo Chagas", days: 3, room_id: 1) }

		it "should assign guest" do
			get :show, id: 1
			expect(assigns :guest).to eq Guest.first
		end
	end

	describe "GET #index" do
		room = Room.new(number: "204C")
		before(:each) do
			allow(Guest).to receive(:all).and_return([{name: "Beatriz Vieira", days: 3, room_id: 1}, {name: "Gabriel Soares", days: 4, room_id: 1}])
		end

		it "should assign guests list" do
			get :index

			guests = Guest.all
			beatriz = guests[0]
			gabriel = guests[1]
			expect(assigns :guests).to eq [beatriz, gabriel]
		end
	end
end
