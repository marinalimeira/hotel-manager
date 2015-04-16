require 'spec_helper'

describe InvoicesController, :type => :controller do
        
    @room = Room.new(number: '314A')
    @guest = Guest.new(name: 'Joaquim Moraes', days: 3, checkin: Date.today.in_time_zone, room_id: 1)
    @item = Item.new(name: "Queijo", price: 2, quantity_in_stock: 10)
         
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
        it "should assign created invoice" do
            post :create, invoice: {item_id: 1, item_quantity: 2, guest_id: 1, amount: 4}
         
            expect(assigns :invoice).to eq Invoice.first
        end

        it "should redirect to invoices/show/:id" do
            
            invoice = Invoice.first
            expect(response).to redirect_to "/invoices/#{invoice.id}"
        end
    end
        
    describe "GET #show" do
        before(:each) { Invoice.create(item_id: 1, item_quantity: 2, guest_id: 1, amount: 4) }

        it "should assign invoice" do
            get :show, id: 1
            expect(assigns :invoice).to eq Invoice.first
        end
    end

    describe "GET #index" do
        before(:each) do
            allow(Invoice).to receive(:all).and_return([{item_id: 1, item_quantity: 3, guest_id: 1, amount: 6}, {item_id: 1, item_quantity: 5, guest_id: 1, amount: 10}])
        end

        it "should assign invoices list" do
            get :index

            invoices = Invoice.all
            invoice1 = invoices[0]
            invoice2 = invoices[1]
            expect(assigns :invoices).to eq [invoice1, invoice2]
        end
    end
end
