class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(email: params[:session][:email])

        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            render json: @user, except: [:password_digest]
        else 
            render json: {
                error: "Invalid Credentials"
            }
        end 
    end 

    def get_current_user
        if logged_in?
            render json: current_user, except: [:password_digest] 
        else 
            render :nothing => true
        end 
    end 

    def destroy 
        session.clear
        render json: {
            notice: "You have been logged out."
        }
    end 
end
