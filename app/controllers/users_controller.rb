class UsersController < ApplicationController
  
    def show
        @user = User.find(params[:id])
        #@articles = @user.articles #before pagination
        @articles = @user.articles.paginate(page: params[:page], per_page: 4)
         
    end

    def index
        #@users = User.all # - before pagination
        @users = User.paginate(page: params[:page], per_page: 4)  
    end

    def index
        @users = User.all   
    end

    def new
        @user = User.new
    end

    def edit #Find user by id
        @user = User.find(params[:id])
    end

    def update #update user
        @user = User.find(params[:id])
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
            flash[:notice] = "Welcome to the Alpha Blog, #{@user.username}, you have successfully signed up"
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