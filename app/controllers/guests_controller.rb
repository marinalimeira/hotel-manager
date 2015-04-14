class GuestsController < ApplicationController
    
    def new
        @guest = Guest.new 
    end
    
    def create
        @room = Room.find(params[:room_id])
        @guest = room.guests.create(guest_params)
    
        if @guest.save
            redirect_to guest_path(@guest)
        else
            render 'new'
        end
    end
    
    private
    def guest_params
      params.require(:guest).permit(:room_id, :name, :days)
    end
end
