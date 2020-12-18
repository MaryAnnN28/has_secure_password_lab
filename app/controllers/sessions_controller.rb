class SessionsController < ApplicationController

     def new
     end

     def create
          @user = User.find_by(name: params[:user][:name])
          if @user && @user.authenticate(params[:user][:password])
               session[:id] = @user.id
               redirect_to user_path(@user)
          else
               flash[:error] = ['Name or password is incorrect']
               redirect_to new_user_path
          end
     end

end

