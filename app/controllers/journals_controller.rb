class JournalsController < ApplicationController
    
    def index
        @journals = Journal.all.order("created_at DESC")
    end

    def new
        @journal = Journal.new()
    end

    def create
        @journal = Journal.new(journal_params)
        if @journal.save
            redirect_to @journal
        else
            render :new
        end
    end

    def show
        @journal = Journal.find(params[:id])
    end

    def update
        @journal = Journal.find(params[:id])
        if @journal.update(journal_params)
            redirect_to @journal
        else
            render :edit
        end
    end

    def edit
        @journal = Journal.find(params[:id])
        render :edit
    end

    def destroy
        Journal.find(params[:id]).destroy
        redirect_to journals_path
    end

    private

    def journal_params
        params.require(:journal).permit(:day, :month, :year, :title, :description)
    end


end
