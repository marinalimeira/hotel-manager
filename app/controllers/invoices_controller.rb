class InvoicesController < ApplicationController
    def new
        @invoice = Invoice.new 
    end
    
    def create
        @invoice = Invoice.new(invoice_params)
        
        @item = Item.find(@invoice.item_id)
        
        if @item.quantity_in_stock >= @invoice.item_quantity
            @item.update(quantity_in_stock: @item.quantity_in_stock - @invoice.item_quantity)
            @item.save
        else
            @invoice.errors.add('You dont have quantity enougth in stock!')
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