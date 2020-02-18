class SessionsController < ApplicationController
    protect_from_forgery

     
    def omniauth
      @user = User.find_or_create_by(uid: auth[:uid]) do |u|
        u.username = auth[:info][:email]
        u.email = auth[:info][:email]
        u.password = SecureRandom.hex
      end
  
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        #flash[:message] = @user.errors.full_messages
        redirect_to '/signup'
      end
    end

    def create
     
      redirect_to '/show'
    end
    

    
    private

    def auth
      request.env['omniauth.auth']
    end
end