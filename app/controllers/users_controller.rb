class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    @buyer_appointments = buyer_appointments(@user)
  end

  private

  def set_user
    if User.find(params[:id]) == current_user
      @user = User.find(params[:id])
    else
      flash[:notice] = "You have no right to access this page"
      redirect_to ( session[:previous_url] || root_path )
    end
  end

  def buyer_appointments(user)
    user.appointments
  end
end
