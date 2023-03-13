class SearchController < ApplicationController
  def index
    @q = Entry.ransack(params[:q])
    @entries = @q.includes(:title, :day, :month, :year, :description).where()
 
  end
end
