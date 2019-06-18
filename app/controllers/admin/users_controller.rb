class Admin::UsersController < Admin::BaseController

  before_action :set_user, only: [:add_admin, :remove_admin]

  def index
    @users = User.where.not(id: current_user.id).all
  end

  def add_admin
    @user.update(admin: 't')
    redirect_to action: :index
  end

  def remove_admin
    @user.update(admin: 'f')
    redirect_to action: :index
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end