class Admin::UsersController < AdminController

  def index
    @users = User.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  def set_admin
    user = User.find(params[:id])
    user.update(admin: '1')
    redirect_to admin_users_path
  end

  def remove_admin
    user = User.find(params[:id])
    user.update(admin: '0')
    redirect_to admin_users_path
  end

end