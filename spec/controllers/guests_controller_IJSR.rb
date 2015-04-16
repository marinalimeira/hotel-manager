#fazer teste com a criação de um room?
#testar o negócio da data?
#ver o negócio de 31+5
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
		it "should assign created guest" do
			post :create, room: { number: "204C" }
			post :create, guest: { name: "Beatriz Vieira", days: 3, room_id: 1}
			expect(assigns :room).to eq Room.first
			expect(assigns :guest).to eq Guest.first
		end

		it "should redirect to rooms/show/:id" do
			post :create, room: { number: "204C" }
			post :create, guest: { name: "Beatriz Vieira", days: 3, room_id: 1}
			guest = Guest.first
			expect(response).to redirect_to "/guests/#{guest.id}"
		end
			
		it "should sum the checkin date with the qnt of days" do
				guest = Guest.new
				guest.checkin = Date.new(2001,2,3,4,5,6,'+03:00')
				guest.days = 3
				guest.checkout = guest.checkin
				guest.checkout.mday = guest.checkin.mday + days
		
				expect(guest.checkout).to eq(DateTime.new(2001,2,6,4,5,6,'+03:00'))
	end

	describe "GET #show" do
		post :create, room: { number: "204C" }
		before(:each) { Room.create(name: "Beatriz Vieira", days: 3, room_id: 1) }

		it "should assign guest" do
			get :show, id: 1
			expect(assigns :guest).to eq Guest.first
		end
	end

	describe "GET #index" do
		post :create, room: { number: "204C" }
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
