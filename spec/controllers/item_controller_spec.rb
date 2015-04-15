require 'spec_helper'

describe ItemsController, :type => :controller do
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
		it "should assign created item" do
			post :create, item: { name: "Sanduiche", price: 6.0, quantity_in_stock: 11}
			expect(assigns :item).to eq Item.first
		end

		it "should redirect to items/show/:id" do
			post :create, item: {name: "Sanduiche", price: 6.0, quantity_in_stock: 11}

			item = Item.first
			expect(response).to redirect_to "/items/#{item.id}"
		end
	end

	describe "GET #show" do
		before(:each) { Item.create(name: "Sanduiche", price: 6.0, quantity_in_stock: 11) }

		it "should assign item" do
			get :show, id: 1
			expect(assigns :item).to eq Item.first
		end
	end

	describe "GET #index" do
		before(:each) do
			allow(Item).to receive(:all).and_return([{name: "Biscoito", price: 2.0, quantity_in_stock: 19}, {name: "Bolacha", price: 1.0, quantity_in_stock: 8}])
		end

		it "should assign items list" do
			get :index

			items = Item.all
			biscoito = items[0]
			bolacha = items[1]
			expect(assigns :items).to eq [biscoito, bolacha]
		end
	end
end
