# encoding: utf-8
require 'date'

class GuestsController < ApplicationController
    
    Time.zone = 'America/Sao_Paulo'
    
    def new
        @guest = Guest.new 
    end
    
    def create
        room = Room.find(params[:room_id])
        @guest = room.guests.create(guest_params)
        @guest.checkin = Date.today.in_time_zone
        @guest.checkout = @guest.checkin + @guest.days.days
        @guest.amount = 0
        
        if room.available
            room.available = false
            room.save
            if @guest.save
                redirect_to @guest
            else
                render 'new'
            end
        else
            @guest.errors.add(:room_id, 'this room isnt available!')
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