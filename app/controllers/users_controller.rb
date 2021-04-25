class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #byebug# - used to pause the server and see what is being passed in
        #do action, then look in terminal; can type params to learn more
        #type continue in terminal to resume action
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to the Alpha Blog, #{@user.username} have successfully signed up"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    end