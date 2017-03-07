class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
    @buyer_appointments = buyer_appointments(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def buyer_appointments(user)
    user.appointments
  end
end
