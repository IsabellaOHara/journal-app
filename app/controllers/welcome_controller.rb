class WelcomeController < ApplicationController
  def index
    @entries = Entry.all.order("created_at DESC")
    @journals = Journal.all.order("created_at DESC")
  end
end
