class GuestsController < ApplicationController
    
    def new
        @guest = Guest.new 
    end
    
    def create
        @room = Room.find(params[:room_id])
        @guest = room.guests.create(guest_params)
    
        if @guest.save
            redirect_to @guest
        else
            render 'new'
        end
    end
    
     def show
       @guest = Guest.find(params[:id]) 
    end
    
     def index
        @guests = Guest.all
    end
    
    def edit
        @guest = Guest.find(params[:id]) 
    end
    
    def update
        @guest = Guest.find(params[:id]) 
        
        if @guest.update(guest_params)
            redirect_to @guest
        else
            render 'edit'
        end
    end
    
    def destroy
        @guest = Guest.find(params[:id])
        @guest.destroy
 
        redirect_to guests_path
    end
    
    private
        def guest_params
            params.require(:guest).permit(:room_id, :name, :days)
        end
end