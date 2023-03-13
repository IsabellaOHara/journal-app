class EntriesController < ApplicationController
    def index
        @entries = Entry.all.order("created_at DESC")
    end
 
    def new
        @entry = Entry.new()
    end
 
    def create
        @entry = Entry.new(entry_params.except(:tags))
        create_or_delete_entries_tags(@entry, params[:entry][:tags])
        if @entry.save
            redirect_to @entry
        else
            render :new
        end
    end

    def show
        @entry = Entry.find(params[:id])
    end

    def update
        @entry = Entry.find(params[:id])
        create_or_delete_entries_tags(@entry, params[:entry][:tags])
        if @entry.update(entry_params.except(:tags))
            redirect_to @entry 
        else 
            render :edit
        end
    end
    
    def edit
        @entry = Entry.find(params[:id])
        render :edit
    end
 
    def destroy
        Entry.find(params[:id]).destroy
        redirect_to entries_path
    end

    def search_entries
        if @entry = Entry.all.find{|entry| entry.name.include?(params[:search])}
        redirect_to player_path(@entry)
        end
    end

    private

    def create_or_delete_entries_tags(entry, tags)
        entry.taggables.destroy_all
        tags = tags.strip.split(',')
        tags.each do |tag|
            entry.tags << Tag.find_or_create_by(name: tag)
        end
    end
 
    def entry_params
        params.require(:entry).permit(:group, :name, :link, :notes, :tags)
    end

 
end
