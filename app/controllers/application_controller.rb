class ApplicationController < ActionController::Base

    before_action :set_query

    def set_query
        @q = Entry.ransack(params[:q])
    end
end
