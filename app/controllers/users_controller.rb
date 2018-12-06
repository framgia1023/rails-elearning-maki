class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Framgia E-Learning System!"
            redirect_to root_url
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 10)
    end

    def edit
        @user = User.find(params[:id])
    end


    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Successfully updated profile!"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
