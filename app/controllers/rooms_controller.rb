class RoomsController < ApplicationController
    
    def new
        @room = Room.new 
    end
    
    def create
        @room = Room.new(room_params)
        @room.available = true
        
        if @room.save
            redirect_to @room
        else
            render'new'
        end
    end
    
    def show
       @room = Room.find(params[:id]) 
    end
    
     def index
        @rooms = Room.all
    end
    
    def edit
        @room = Room.find(params[:id]) 
    end
    
    def update
        @room = Room.find(params[:id]) 
        
        if @room.update(room_params)
            redirect_to @room
        else
            render 'edit'
        end
    end
    
    def destroy
        @room = Room.find(params[:id])
        @room.destroy
 
        redirect_to rooms_path
    end

    private
    def room_params
        params.require(:room).permit(:number)
    end
end