class WelcomeController < ApplicationController
  def index
    @entries = Entry.all
    @journals = Journal.all
  end
end
