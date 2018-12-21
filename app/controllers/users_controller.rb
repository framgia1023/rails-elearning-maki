class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :require_admin, only: :destroy
    
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Framgia E-Learning System!"
            redirect_to new_user_url
        else
            render 'new'
        end
    end

    def show
        @user = User.find(params[:id])
        @activities = @user.activities.paginate(page: params[:page], per_page: 8).order('created_at DESC')
    end

    def index
        @users = User.search(params[:search]).paginate(page: params[:page], per_page: 8).order('created_at DESC')
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

    def following
        @user = User.find(params[:id])
        @lesson = Lesson.find_by(user_id: @user)
        @users = @user.following
        render 'show_follow'
    end

    def followers
        @user = User.find(params[:id])
        @lesson = Lesson.find_by(user_id: @user)
        @users = @user.followers
        render 'show_follower'
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
    end

    def require_login
        unless logged_in?
            flash[:info] = "Please login to gain access." 
            redirect_to login_url
        end
    end
        
    def require_admin
        unless current_user.admin?
            flash[:danger] = "Only administrators can delete!"
            redirect_to root_url
        end
    end

end
