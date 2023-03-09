class EntriesController < ApplicationController
    def index
        @entries = Entry.all.order("created_at DESC")
    end
 
    def new
        @entry = Entry.new()
    end
 
    def create
        @entry = Entry.new(entry_params)
        if @entry.save
            redirect_to @entry
        else
            render :new
        end
    end

    def show
    end

    def update
        if @entry.update(entry_params)
            redirect_to @entry 
        else 
            render :edit 
        end
    end
    
    def edit
        @entry = Entry.find(params[:id])
    end
 
    def destroy
        Entry.find(params[:id]).destroy
        redirect_to entries_path
    end

    private
 
    def entry_params
        params.require(:entry).permit(:group, :name, :link, :notes)
    end

 
end
