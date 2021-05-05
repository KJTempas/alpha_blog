class ApplicationController < ActionController::Base
#methods here are available to ALL controllers
    helper_method :current_user, :logged_in? #adding this line makes the method availble to views as well as controllers

    def current_user #retrieve current user instance var or look up in dbase
        @current_user ||= User.find(session[:user_id]) if session[:user_id]  #access current user by id
    end

    def logged_in?
        !!current_user  # !! makes current_user a boolean
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path
        end
    end
end
