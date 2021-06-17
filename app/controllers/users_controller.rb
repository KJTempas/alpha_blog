class UsersController < ApplicationController
    #before performing the method for show, edit or update, do the set_user method(below private method)
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]


    def show
        #@articles = @user.articles #before pagination
        @articles = @user.articles.paginate(page: params[:page], per_page: 4)
         
    end

    def index
        @users = User.all # - before pagination
        #@users = User.paginate(page: params[:page], per_page: 4)  
    end

    def new
        @user = User.new
    end

    def edit #Find user by id
    end

    def update #update user
        if @user.update(user_params)#user params method white lists incoming info
            flash[:notice] = "Your account information was successfully updated"
            redirect_to @user
        else   
            render 'edit'
        end
    end

    def create
        #byebug# - used to pause the server and see what is being passed in
        #do action, then look in terminal; can type params to learn more
        #type continue in terminal to resume action
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            flash[:notice] = "Welcome to the Alpha Blog, #{@user.username}, you have successfully signed up"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def destroy
        @user.destroy
        #session[:user_id] = nil #must do this to avoid crash user is deleted #before admin added
        #sets user id to nil only if user is current user; if is admin, don't set to nil (log out admin)
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Account and all associated articles successfully deleted"
        redirect_to articles_path
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "You can only edit or delete your own account"
            redirect_to @user
        end
    end
end