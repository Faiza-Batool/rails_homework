class UsersController < ApplicationController
    
    # before_action :authorize_user!, only: [:edit, :update, :edit_password, :change_password]
    before_action :authorize_user!, only: [:update, :change_password]

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: 'Signed in'
        else
            render :new
        end
    end
    
    def edit
        @user = User.find params[:id]
    end

    def update
        @user = current_user
        if @user.update params.require(:user).permit(
            :first_name,
            :last_name,
            :email
        )
            redirect_to root_path, notice: 'Profile updated'
        else
          render 'edit'
        end
    end

    def edit_password
        @user = User.find params[:id]
    end

    def change_password
        @user = current_user
        
        if(@user.authenticate(params[:user][:current_password]))
            if(params[:user][:current_password]!=params[:user][:new_password])#&&(params[:user][:new_password]==params[:user][:new_password_confirmation])
               
               if @user.update(password:params[:user][:new_password], password_confirmation:params[:user][:new_password_confirmation])
                flash[:notice] =  "Password changed successfully "
                redirect_to root_path 
               else
                flash[:alert] = "new password and current password should be same "
                render  :edit_password
               end
            else
                flash[:alert] = "New and old password shouldn't be same "
                render  :edit_password
            end
        else
            flash[:alert]=  "incorrect password "
            redirect_to root_path
        end

    end

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
            :password_confirmation
        )
    end

    def authorize_user!
        @user = User.find params[:id]
        redirect_to root_path, alert: "Not Authorized!" unless can?(:crud, @user)
    end
end
   
   