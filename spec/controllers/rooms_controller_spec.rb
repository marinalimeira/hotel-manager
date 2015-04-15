require 'spec_helper'

describe RoomsController, :type => :controller do
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
		it "should assign created room" do
			post :create, room: { number: "204C" }
			expect(assigns :room).to eq Room.first
		end

		it "should redirect to rooms/show/:id" do
			post :create, room: { number: "204C" }

			room = Room.first
			expect(response).to redirect_to "/rooms/#{room.id}"
		end
	end

	describe "GET #show" do
		before(:each) { Room.create(number: "204C") }

		it "should assign room" do
			get :show, id: 1
			expect(assigns :room).to eq Room.first
		end
	end

	describe "GET #index" do
		before(:each) do
			allow(Room).to receive(:all).and_return([{number: "103A"}, {number: "104A"}])
		end

		it "should assign rooms list" do
			get :index

			rooms = Room.all
			room1 = rooms[0]
			room2 = rooms[1]
			expect(assigns :rooms).to eq [room1, room2]
		end
	end
end
