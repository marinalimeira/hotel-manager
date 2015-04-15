class InvoicesController < ApplicationController
    def new
        @invoice = Invoice.new 
    end
    
    def create
        @guest = Guest.new(params[:guest_id])
        @item = Item.new(params[:item_id])
        #?
        @invoice = Invoice.new(invoice_params)
        
        if @item.quantity_in_stock >= @invoice.item_quantity
            @item.update(quantity_in_stock: @item.quantity_in_stock - @invoice.item_quantity)
            @item.save
        else
            #?
            raise 'You dont have quantity enougth in stock!'
        end
        
        @invoice.amount = @invoice.item_quantity * @item.price
        
        if @invoice.save
            redirect_to @invoice
        else
            render 'new'
        end
    end
        
    def show
       @invoice = Invoice.find(params[:id]) 
    end
    
    def index
        @invoices = Invoice.all
    end
    
    def edit
        @invoice = Invoice.find(params[:id]) 
    end
    
    def destroy
        @invoice = Invoice.find(params[:id])
        @invoice.destroy
 
        redirect_to invoices_path
    end

    private
    def invoice_params
        params.require(:invoice).permit(:item_id, :item_quantity, :amount, :guest_id)
    end
end