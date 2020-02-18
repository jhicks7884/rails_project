class UsersController < ApplicationController
   # protect_from_forgery
  # before_action :authenticate

    def user   #homepage
      render "/home"
    end

    def user_sign_up  #sign_up page
      render "/signup"
    end

    def new_sign_up  # creating users
        @user = User.create(user_params)
        if @user.valid?
           @user.save
           session["user_id"] = @user.id

           redirect_to '/show'
        else
            redirect_to '/login'
        end
    end

    def user_login # logging in a user
        if logged_in?
          @user = User.find(username: params[:username])
          @user && @user.authenticate(params[:password])
          @user.valid?
          @user.save
          session[:user_id] = @user.id
          redirect_to '/show'
        else
          redirect_to '/login'
        end
    end

    def logout  #signing a user out
        session.clear
        redirect_to "/home"

    end


    private

    def user_params
        params.require(:users).permit(:username, :email, :password)
    end
end