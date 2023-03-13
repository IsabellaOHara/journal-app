class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to entries_path
        else
            message = "Something went wrong! Make sure yout username and password are correct."
            redirect_to login_path, notice: message
        end
    end
end