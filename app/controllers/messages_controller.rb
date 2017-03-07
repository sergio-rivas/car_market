class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    authorize @message
    @message.user = current_user

    if @message.save
      @message.send_message

      redirect_to @message.car, notice: 'SMS was successfully sent.'
    else
      flash[:notice] = "Some error occured"
      redirect_to @message.car
    end
  end

  private

  def message_params
    params.permit(:content, :user_id, :car_id)
  end

end
