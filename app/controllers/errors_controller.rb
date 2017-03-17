class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:not_found, :internal_server_error]

  def not_found
    render(:status => 404)
    authorize self
  end

  def internal_server_error
    render(:status => 500)
    authorize self
  end
end
